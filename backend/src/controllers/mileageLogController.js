const MileageLog = require('../models/MileageLog');
const {mileageLogToDto} = require("../dtos/mileageLog.dto");

module.exports = {
    async getAll(req, res) {
        const mileageLogs = await MileageLog.findAll();
        res.json(mileageLogs.map(mileageLog => mileageLogToDto(mileageLog)));
    },

    async getById(req, res) {
        const mileageLog = await MileageLog.findByPk(req.params.id);
        if (!mileageLog) return res.status(404).json({error: 'MileageLog not found'});
        res.json(mileageLogToDto(mileageLog));
    },

    async create(req, res) {
        const newUser = await MileageLog.create(req.body);
        res.status(201).json(mileageLogToDto(newUser));
    },

    async update(req, res) {
        const mileageLog = await MileageLog.findByPk(req.params.id);
        if (!mileageLog) return res.status(404).json({error: 'MileageLog not found'});
        await mileageLog.update(req.body);
        res.json(mileageLogToDto(mileageLog));
    },

    async delete(req, res) {
        const mileageLog = await MileageLog.findByPk(req.params.id);
        if (!mileageLog) return res.status(404).json({error: 'MileageLog not found'});
        await mileageLog.destroy();
        res.status(204).send();
    }
};
