const Vehicle = require('../models/Vehicle');
const {vehicleToDto} = require("../dtos/vehicle.dto");

module.exports = {
    async getAll(req, res) {
        const vehicles = await Vehicle.findAll();
        res.json(vehicles.map(vehicle => vehicleToDto(vehicle)));
    },

    async getById(req, res) {
        const vehicle = await Vehicle.findByPk(req.params.id);
        if (!vehicle) return res.status(404).json({error: 'Vehicle not found'});
        res.json(vehicleToDto(vehicle));
    },

    async create(req, res) {
        const newUser = await Vehicle.create(req.body);
        res.status(201).json(vehicleToDto(newUser));
    },

    async update(req, res) {
        const vehicle = await Vehicle.findByPk(req.params.id);
        if (!vehicle) return res.status(404).json({error: 'Vehicle not found'});
        await vehicle.update(req.body);
        res.json(vehicleToDto(vehicle));
    },

    async delete(req, res) {
        const vehicle = await Vehicle.findByPk(req.params.id);
        if (!vehicle) return res.status(404).json({error: 'Vehicle not found'});
        await vehicle.destroy();
        res.status(204).send();
    }
};
