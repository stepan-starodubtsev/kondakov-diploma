import apiClient from "../utils/apiClient.js";

export async function fetchUsers() {
    try {
        const response = await apiClient.get('/users');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createUser(user) {
    const userData = { name: user.name };
    try {
        const response = await apiClient.post(`/users`, userData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateUser(userId, user) {
    const userData = { name: user.name };
    try {
        const response = await apiClient.put(`/users/${userId}`, userData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteUser(userId) {
    try {
        await apiClient.delete(`/users/${userId}`);
    } catch (error) {
        console.error(error);
    }
}
