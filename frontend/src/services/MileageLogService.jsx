import apiClient from "../utils/apiClient.js";

export async function fetchMileageLogs() {
    try {
        const response = await apiClient.get('/mileage-logs');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createMileageLog(mileageLog) {
    const mileageLogData = { name: mileageLog.name };
    try {
        const response = await apiClient.post(`/users`, mileageLogData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateMileageLog(mileageLogId, mileageLog) {
    const mileageLogData = { name: mileageLog.name };
    try {
        const response = await apiClient.put(`/users/${mileageLogId}`, mileageLogData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteMileageLog(mileageLogId) {
    try {
        await apiClient.delete(`/mileage-logs/${mileageLogId}`);
    } catch (error) {
        console.error(error);
    }
}
