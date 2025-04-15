const MileageLog = require('../models/MileageLog');
const {mileageLogToDto} = require("../dtos/mileageLog.dto");
const {getAllMileageLogs, createMileageLog, getMileageLogById, deleteMileageLog} = require("../services/MileageLogService");
const {getMaintenanceById} = require("../services/MaintenanceService");

module.exports = {
    async getAll(req, res) {
        const mileageLogDTOs = await getAllMileageLogs();
        res.json(mileageLogDTOs);
    },

    async getById(req, res) {
        const mileageLogDTO = await getMileageLogById(req.params.id);
        res.json(mileageLogToDto(mileageLogDTO));
    },

    async create(req, res) {
        const newMileageLog = await createMileageLog(req.body);
        res.status(201).json(newMileageLog);
    },

    async delete(req, res) {
        await deleteMileageLog(req.params.id);
        res.status(204).send();
    }
};
