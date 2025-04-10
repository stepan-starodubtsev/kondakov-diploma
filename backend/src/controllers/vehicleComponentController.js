const VehicleComponent = require('../models/VehicleComponent');
const {vehicleComponentToDto} = require("../dtos/vehicleComponent.dto");

module.exports = {
    async getAll(req, res) {
        const vehicleComponents = await VehicleComponent.findAll();
        res.json(vehicleComponents.map(vehicleComponent => vehicleComponentToDto(vehicleComponent)));
    },

    async getById(req, res) {
        const vehicleComponent = await VehicleComponent.findByPk(req.params.id);
        if (!vehicleComponent) return res.status(404).json({error: 'Vehicle component not found'});
        res.json(vehicleComponentToDto(vehicleComponent));
    },

    async create(req, res) {
        const newUser = await VehicleComponent.create(req.body);
        res.status(201).json(vehicleComponentToDto(newUser));
    },

    async update(req, res) {
        const vehicleComponent = await VehicleComponent.findByPk(req.params.id);
        if (!vehicleComponent) return res.status(404).json({error: 'Vehicle component not found'});
        await vehicleComponent.update(req.body);
        res.json(vehicleComponentToDto(vehicleComponent));
    },

    async delete(req, res) {
        const vehicleComponent = await VehicleComponent.findByPk(req.params.id);
        if (!vehicleComponent) return res.status(404).json({error: 'Vehicle component not found'});
        await vehicleComponent.destroy();
        res.status(204).send();
    }
};
