const LogEntry = require('../models/LogEntry');
const {logEntryToDto} = require("../dtos/logEntry.dto");

module.exports = {
    async getAll(req, res) {
        const logEntries = await LogEntry.findAll();
        res.json(logEntries.map(logEntry => logEntryToDto(logEntry)));
    },

    async getById(req, res) {
        const logEntry = await LogEntry.findByPk(req.params.id);
        if (!logEntry) return res.status(404).json({error: 'LogEntry not found'});
        res.json(logEntryToDto(logEntry));
    },

    async create(req, res) {
        const newUser = await LogEntry.create(req.body);
        res.status(201).json(logEntryToDto(newUser));
    },

    async update(req, res) {
        const logEntry = await LogEntry.findByPk(req.params.id);
        if (!logEntry) return res.status(404).json({error: 'LogEntry not found'});
        await logEntry.update(req.body);
        res.json(logEntryToDto(logEntry));
    },

    async delete(req, res) {
        const logEntry = await LogEntry.findByPk(req.params.id);
        if (!logEntry) return res.status(404).json({error: 'LogEntry not found'});
        await logEntry.destroy();
        res.status(204).send();
    }
};
