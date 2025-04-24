import apiClient from "../utils/apiClient.js";

export async function fetchRepairs() {
    try {
        const response = await apiClient.get('/repairs');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createRepair(repair) {
    const repairData = { name: repair.name };
    try {
        const response = await apiClient.post(`/repairs`, repairData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateRepair(repairId, repair) {
    const repairData = { name: repair.name };
    try {
        const response = await apiClient.put(`/repairs/${repairId}`, repairData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteRepair(repairId) {
    try {
        await apiClient.delete(`/repairs/${repairId}`);
    } catch (error) {
        console.error(error);
    }
}
