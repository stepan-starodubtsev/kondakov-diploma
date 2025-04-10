const Maintenance = require('../models/Maintenance');
const {maintenanceToDto} = require("../dtos/maintenance.dto");

module.exports = {
    async getAll(req, res) {
        const maintenance = await Maintenance.findAll();
        res.json(maintenance.map(maintenance => maintenanceToDto(maintenance)));
    },

    async getById(req, res) {
        const maintenance = await Maintenance.findByPk(req.params.id);
        if (!maintenance) return res.status(404).json({error: 'Maintenance not found'});
        res.json(maintenanceToDto(maintenance));
    },

    async create(req, res) {
        const newUser = await Maintenance.create(req.body);
        res.status(201).json(maintenanceToDto(newUser));
    },

    async update(req, res) {
        const maintenance = await Maintenance.findByPk(req.params.id);
        if (!maintenance) return res.status(404).json({error: 'Maintenance not found'});
        await maintenance.update(req.body);
        res.json(maintenanceToDto(maintenance));
    },

    async delete(req, res) {
        const maintenance = await Maintenance.findByPk(req.params.id);
        if (!maintenance) return res.status(404).json({error: 'Maintenance not found'});
        await maintenance.destroy();
        res.status(204).send();
    }
};
