import apiClient from "../utils/apiClient.js";

export async function fetchVehicles() {
    try {
        const response = await apiClient.get('/vehicles');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createVehicle(vehicle) {
    const vehicleData = { name: vehicle.name };
    try {
        const response = await apiClient.post(`/vehicles`, vehicleData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateVehicle(vehicleId, vehicle) {
    const vehicleData = { name: vehicle.name };
    try {
        const response = await apiClient.put(`/vehicles/${vehicleId}`, vehicleData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteVehicle(vehicleId) {
    try {
        await apiClient.delete(`/vehicles/${vehicleId}`);
    } catch (error) {
        console.error(error);
    }
}
