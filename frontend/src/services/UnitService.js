import apiClient from "../utils/apiClient.js";

export async function fetchUnits() {
    try {
        const response = await apiClient.get('/units');
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function createUnit(unit) {
    const unitData = { name: unit.name };
    try {
        const response = await apiClient.post(`/users`, unitData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function updateUnit(unitId, unit) {
    const unitData = { name: unit.name };
    try {
        const response = await apiClient.put(`/users/${unitId}`, unitData);
        return response.data;
    } catch (error) {
        console.error(error);
        return null;
    }
}

export async function deleteUnit(unitId) {
    try {
        await apiClient.delete(`/units/${unitId}`);
    } catch (error) {
        console.error(error);
    }
}
