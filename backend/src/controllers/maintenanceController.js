const Maintenance = require('../models/Maintenance');
const {maintenanceToDto} = require("../dtos/maintenance.dto");
const {getAllMaintenances, getMaintenanceById, createMaintenance, updateMaintenance, deleteMaintenance} = require("../services/MaintenanceService");

module.exports = {
    async getAll(req, res) {
        const maintenanceDTOs = getAllMaintenances();
        res.json(maintenanceDTOs);
    },

    async getById(req, res) {
        const maintenanceDTO = getMaintenanceById(req.params.id);
        res.json(maintenanceDTO);
    },

    async create(req, res) {
        const newMaintenanceDTO = createMaintenance(req.body);
        res.status(201).json(newMaintenanceDTO);
    },

    async update(req, res) {
        const maintenanceDTO = updateMaintenance(req.params.id, req.body);
        res.json(maintenanceToDto(maintenanceDTO));
    },

    async delete(req, res) {
        await deleteMaintenance(req.params.id);
        res.status(204).send();
    }
};
