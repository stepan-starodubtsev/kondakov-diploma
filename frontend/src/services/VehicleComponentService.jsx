import apiClient from "../utils/apiClient.js";

export async function fetchVehicleComponents() {
    try {
        const response = await apiClient.get('/vehicle-components');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createVehicleComponent(vehicleComponent) {
    const vehicleComponentData = { name: vehicleComponent.name };
    try {
        const response = await apiClient.post(`/vehicle-components`, vehicleComponentData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateVehicleComponent(vehicleComponentId, vehicleComponent) {
    const vehicleComponentData = { name: vehicleComponent.name };
    try {
        const response = await apiClient.put(`/vehicle-components/${vehicleComponentId}`, vehicleComponentData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteVehicleComponent(vehicleComponentId) {
    try {
        await apiClient.delete(`/vehicle-components/${vehicleComponentId}`);
    } catch (error) {
        console.error(error);
    }
}
