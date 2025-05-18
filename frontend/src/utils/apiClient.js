import axios from "axios";
import {BASE_URL} from "./constants.js"

const apiClient = axios.create({
    baseURL: BASE_URL,
});

let _getAuthTokenFunction = () => null;
let _logoutUserFunction = () => {
    console.error("logoutUserFunction in apiClient has not been configured by AuthStore.");
    localStorage.removeItem("user");
    localStorage.removeItem("accessToken");
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

apiClient.interceptors.request.use(
    (config) => {
        const token = _getAuthTokenFunction();
        console.log("apiClient Request Interceptor - Token for /api/auth/me:", token);
        if (token && token !== "undefined") {
            config.headers["Authorization"] = `Bearer ${token}`;
        } else {
            delete config.headers["Authorization"];
        }
        return config;
    },
    (error) => {
        console.error('Request error in apiClient interceptor:', error);
        return Promise.reject(error);
    }
);

apiClient.interceptors.response.use(
    (response) => response,
    async (error) => {
        const originalRequest = error.config;

        console.log(error.response?.status);
        console.log(originalRequest.url);
        if (error.response?.status === 401 &&
            originalRequest &&
            originalRequest.url &&
            (!originalRequest.url.endsWith('/auth/login') ||
                !originalRequest.url.endsWith('/auth/me'))
        ) {
            console.warn('API Client: Received 401 Unauthorized. Logging out user.');
            _logoutUserFunction();
        }
        return Promise.reject(error);
    }
);

export default apiClient;