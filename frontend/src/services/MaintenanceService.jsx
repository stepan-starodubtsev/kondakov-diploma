import apiClient from "../utils/apiClient.js";

export async function fetchMaintenances() {
    try {
        const response = await apiClient.get('/maintenances');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createMaintenance(maintenance) {
    const maintenanceData = { name: maintenance.name };
    try {
        const response = await apiClient.post(`/maintenances`, maintenanceData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateMaintenance(maintenanceId, maintenance) {
    const maintenanceData = { name: maintenance.name };
    try {
        const response = await apiClient.put(`/maintenances/${maintenanceId}`, maintenanceData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteMaintenance(maintenanceId) {
    try {
        await apiClient.delete(`/maintenances/${maintenanceId}`);
    } catch (error) {
        console.error(error);
    }
}
