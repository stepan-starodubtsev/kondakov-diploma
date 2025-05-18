// src/stores/authStore.js
import { flow, makeObservable, observable, computed, action, runInAction } from 'mobx';
import apiClient, { configureApiClientAuth } from "../utils/apiClient.js"; // Або ваш шлях
import { jwtDecode } from 'jwt-decode'; // Імпортуємо jwt-decode

class AuthStore {
    user = null; // Буде об'єктом { id, name, username, role } або як визначено у вашому payload
    accessToken = "";
    loading = false;
    error = null;

    constructor() {
        makeObservable(this, {
            user: observable,
            accessToken: observable,
            loading: observable,
            error: observable,
            isAuthenticated: computed,
            login: flow,
            logout: action.bound,
            validateTokenOnServer: flow, // Перейменовано для ясності
            _setAuthDataFromToken: action, // Новий метод
            clearAuthData: action.bound,
            loadAuthDataFromStorage: action.bound,
        });

        configureApiClientAuth({
            getToken: () => this.accessToken,
            logout: this.logout,
        });

        this.loadAuthDataFromStorage();
    }

    get isAuthenticated() {
        return !!this.accessToken && this.accessToken !== "undefined" && this.user !== null;
    }

    // Новий метод для встановлення даних з розшифрованого токена
    _setAuthDataFromToken(tokenString, fromStorage = false) {
        if (!tokenString || tokenString === "undefined") {
            this.clearAuthData();
            return;
        }
        try {
            // Розшифровуємо токен, щоб отримати payload
            // Припускаємо, що payload JWT містить об'єкт user: { id, name, username, role, ... }
            // або безпосередньо поля id, name, username, role
            const decodedToken = jwtDecode(tokenString);
            console.log("Decoded JWT Payload:", decodedToken);

            let userDataFromToken;
            if (decodedToken.user && typeof decodedToken.user === 'object') {
                // Якщо payload має вигляд { user: { id: ..., username: ..., role: ... } }
                userDataFromToken = decodedToken.user;
            } else if (decodedToken.id && decodedToken.username && decodedToken.role) {
                // Якщо payload має вигляд { id: ..., username: ..., role: ..., name: ... (опціонально) }
                userDataFromToken = {
                    id: decodedToken.id,
                    username: decodedToken.username,
                    role: decodedToken.role,
                    name: decodedToken.name || decodedToken.username, // Якщо name немає, використовуємо username
                    // ... інші поля, які можуть бути в payload
                };
            } else {
                console.error("JWT payload does not contain expected user data structure.", decodedToken);
                this.clearAuthData(); // Якщо структура невідома, краще очистити
                return;
            }

            // Переконуємось, що основні поля є
            if (!userDataFromToken.id || !userDataFromToken.username || !userDataFromToken.role) {
                console.error("Essential user data (id, username, role) missing in token payload.", userDataFromToken);
                this.clearAuthData();
                return;
            }


            this.user = userDataFromToken;
            this.accessToken = tokenString;
            this.error = null;
            // isAuthenticated оновиться автоматично через computed

            if (!fromStorage) {
                localStorage.setItem("accessToken", tokenString);
                localStorage.setItem("user", JSON.stringify(this.user)); // Зберігаємо розшифрованого користувача
            }
            console.log("Auth data set in store from token:", { token: this.accessToken, user: this.user });

        } catch (e) {
            console.error("Failed to decode JWT or set auth data:", e);
            this.clearAuthData();
        }
    }

    clearAuthData() {
        console.log("AuthStore: Clearing authentication data.");
        this.user = null;
        this.accessToken = "";
        localStorage.removeItem("user");
        localStorage.removeItem("accessToken");
        this.error = null;
    }

    loadAuthDataFromStorage() {
        const storedToken = localStorage.getItem("accessToken");
        console.log("AuthStore: Loading data from storage - Token:", storedToken);

        if (storedToken && storedToken !== "undefined") {
            // Замість того, щоб завантажувати 'user' з localStorage,
            // ми розшифруємо 'user' з 'accessToken'
            // Це гарантує, що 'user' завжди відповідає поточному 'accessToken'
            runInAction(() => {
                this._setAuthDataFromToken(storedToken, true); // true - дані з localStorage
            });

            if (this.isAuthenticated) {
                console.log("AuthStore: Data successfully loaded and decoded from storage token.");
                // Валідація токена на сервері після завантаження з localStorage
                this.validateTokenOnServer();
            } else {
                console.warn("AuthStore: Token found in storage but failed to set auth data (e.g., decode failed).");
            }
        } else {
            console.log("AuthStore: No valid token in localStorage to load.");
            runInAction(() => this.clearAuthData());
        }
    }

    *login(username, password) {
        this.loading = true;
        this.error = null;
        try {
            const response = yield apiClient.post("/auth/login", { username, password });
            // Тепер припускаємо, що response.data - це сам JWT токен (рядок)
            // або об'єкт { token: "jwt_string" }
            let tokenString;
            if (typeof response.data === 'string') {
                tokenString = response.data;
            } else if (response.data && typeof response.data.token === 'string') {
                tokenString = response.data.token;
            } else {
                throw new Error("Invalid token format received from login API.");
            }

            // Оновлюємо стан, розшифровуючи токен
            this._setAuthDataFromToken(tokenString);

        } catch (error) {
            this.error = error.response?.data?.message || error.message || "Помилка входу";
            console.error("Login failed in authStore:", this.error, error);
            this.clearAuthData();
        } finally {
            this.loading = false;
        }
    }

    // Цей метод перевіряє валідність токена на сервері
    // і може оновити дані користувача, якщо /api/auth/me повертає актуальні дані
    *validateTokenOnServer() {
        console.log("validateTokenOnServer: Current accessToken:", this.accessToken);
        if (!this.isAuthenticated || !this.accessToken) {
            // Якщо не аутентифікований або немає токена, нічого не робимо,
            // або викликаємо clearAuthData, якщо стан неконсистентний.
            if (this.isAuthenticated || this.accessToken) this.clearAuthData();
            return;
        }
        console.log("AuthStore: Validating token on server...");
        // this.loading = true; // Можна використовувати окремий `validatingToken` стан
        try {
            const response = yield apiClient.get("/auth/me");
            // /api/auth/me повертає UserDto (який є payload.user)
            const userDataFromServer = response.data;

            // Оновлюємо дані користувача та підтверджуємо токен
            // Не викликаємо _setAuthDataFromToken, оскільки токен не змінився,
            // а userDataFromServer - це вже розшифровані дані.
            runInAction(() => {
                this.user = userDataFromServer;
                // accessToken залишається той самий
                localStorage.setItem("user", JSON.stringify(this.user)); // Оновлюємо користувача в localStorage
            });
            console.log("Token validated successfully on server, user data updated:", this.user);
        } catch (error) {
            console.warn("Token validation on server failed:", error.response?.data?.message || error.message);
            // Інтерцептор в apiClient вже має викликати logout() при 401 помилці від /api/auth/me
            // Якщо помилка інша, або для гарантії, можна викликати clearAuthData
            if (error.response?.status !== 401) {
                this.clearAuthData();
            }
        } finally {
            // this.loading = false;
        }
    }

    logout() {
        this.clearAuthData();
        console.log("User logged out.");
        // Перенаправлення на /login краще обробляти в UI (App.jsx або ProtectedRoute)
    }

    get userRole() {
        return this.user ? this.user.role : null;
    }
}

const authStoreInstance = new AuthStore();
export default authStoreInstance;
export { authStoreInstance as authStore };