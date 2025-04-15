import axios from "axios";
// import { authStore } from "../stores/authStore";
import {BASE_URL} from "./constants.js"; // Import the authentication store

const apiClient = axios.create({
    baseURL: BASE_URL,
    withCredentials: true, // Allows sending cookies (important for refresh tokens)
});
//
// // Request Interceptor: Attach Authorization Token
// apiClient.interceptors.request.use(
//     async (config) => {
//         if (authStore.accessToken) {
//             config.headers["Authorization"] = `Bearer ${authStore.accessToken}`;
//         }
//         return config;
//     },
//     (error) => Promise.reject(error)
// );
//
// // Response Interceptor: Handle Token Expiry & Refresh Token Flow
// apiClient.interceptors.response.use(
//     (response) => response,
//     async (error) => {
//         const originalRequest = error.config;
//
//         // If 401 Unauthorized and the request is not already retried
//         if (error.response?.status === 401 && !originalRequest._retry) {
//             originalRequest._retry = true;
//
//             try {
//                 await authStore.refreshToken(); // Refresh access token
//                 originalRequest.headers["Authorization"] = `Bearer ${authStore.accessToken}`;
//                 return apiClient(originalRequest); // Retry the original request
//             } catch (refreshError) {
//                 authStore.logout(); // If refresh fails, log out the user
//                 return Promise.reject(refreshError);
//             }
//         }
//
//         return Promise.reject(error);
//     }
// );

export default apiClient; // Export the centralized Axios instance
