import axios from "axios";
// BASE_URL краще імпортувати з окремого файлу констант, якщо він є
// Наприклад: import { BASE_URL } from "./constants.js";
import {BASE_URL} from "./constants.js" // Або ваша змінна оточення

const apiClient = axios.create({
    baseURL: BASE_URL,
    // withCredentials: true, // Залиште, якщо використовуєте httpOnly cookies для чогось іншого
});

// --- Функції, які будуть встановлені з authStore ---
let _getAuthTokenFunction = () => null;
let _logoutUserFunction = () => {
    console.error("logoutUserFunction in apiClient has not been configured by AuthStore.");
    // Аварійний вихід, якщо функція не була встановлена
    localStorage.removeItem("user");
    localStorage.removeItem("accessToken"); // Використовуємо "accessToken" як ключ з вашого authStore
    // window.location.href = '/login'; // Може спричинити повне перезавантаження
};

/**
 * Дозволяє authStore конфігурувати apiClient своїми методами.
 * @param {object} authProvider
 * @param {() => string | null} authProvider.getToken - Функція, що повертає поточний токен.
 * @param {() => void} authProvider.logout - Функція для виходу користувача з системи.
 */
export const configureApiClientAuth = ({getToken, logout}) => {
    _getAuthTokenFunction = getToken;
    _logoutUserFunction = logout;
    console.log("apiClient configured with auth functions.");
};

// Request Interceptor: Додає Authorization токен до кожного запиту
apiClient.interceptors.request.use(
    (config) => {
        const token = _getAuthTokenFunction();
        console.log("apiClient Request Interceptor - Token for /api/auth/me:", token);
        if (token && token !== "undefined") { // Додаткова перевірка на "undefined" рядок
            config.headers["Authorization"] = `Bearer ${token}`;
        } else {
            // Якщо токена немає, переконуємось, що заголовок не надсилається,
            // особливо якщо він міг бути встановлений для попередніх запитів іншим шляхом.
            delete config.headers["Authorization"];
        }
        return config;
    },
    (error) => {
        console.error('Request error in apiClient interceptor:', error);
        return Promise.reject(error);
    }
);

// Response Interceptor: Обробляє помилки відповіді, зокрема 401
apiClient.interceptors.response.use(
    (response) => response,
    async (error) => {
        const originalRequest = error.config;

        // Якщо помилка 401 (Unauthorized) і це не запит на логін або реєстрацію
        console.log(error.response?.status);
        console.log(originalRequest.url);
        if (error.response?.status === 401 &&
            originalRequest && // Переконуємось, що originalRequest існує
            originalRequest.url && // Переконуємось, що URL існує
            (!originalRequest.url.endsWith('/auth/login') || // Шляхи відносно baseURL
                !originalRequest.url.endsWith('/auth/me'))
        ) {
            console.warn('API Client: Received 401 Unauthorized. Logging out user.');
            _logoutUserFunction();
        }
        return Promise.reject(error);
    }
);

export default apiClient;