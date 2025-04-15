const Vehicle = require('../models/Vehicle');
const {vehicleToDto} = require("../dtos/vehicle.dto");
const {
    getAllVehicles,
    getVehicleById,
    createVehicle,
    updateVehicle,
    deleteVehicle
} = require("../services/VehicleService");

module.exports = {
    async getAll(req, res) {
        const vehicleDTOs = await getAllVehicles();
        res.json(vehicleDTOs);
    },

    async getById(req, res) {
        const vehicleDTO = await getVehicleById(req.params.id);
        res.json(vehicleToDto(vehicleDTO));
    },

    async create(req, res) {
        const newVehicle = await createVehicle(req.body);
        res.status(201).json(newVehicle);
    },

    async update(req, res) {
        const vehicleDTO = await updateVehicle(req.params.id, req.body);
        res.json(vehicleToDto(vehicleDTO));
    },

    async delete(req, res) {
        await deleteVehicle(req.params.id);
        res.status(204).send();
    }
};
