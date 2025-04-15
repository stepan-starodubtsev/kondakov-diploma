import apiClient from "../utils/apiClient.js";

export async function fetchRepairComponents() {
    try {
        const response = await apiClient.get('/repair-components');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createRepairComponent(repairComponent) {
    const repairComponentData = { name: repairComponent.name };
    try {
        const response = await apiClient.post(`/repair-components`, repairComponentData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateRepairComponent(repairComponentId, repairComponent) {
    const repairComponentData = { name: repairComponent.name };
    try {
        const response = await apiClient.put(`/repair-components/${repairComponentId}`, repairComponentData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteRepairComponent(repairComponentId) {
    try {
        await apiClient.delete(`/repair-components/${repairComponentId}`);
    } catch (error) {
        console.error(error);
    }
}
