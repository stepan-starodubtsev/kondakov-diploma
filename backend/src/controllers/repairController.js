const Repair = require('../models/Repair');
const {repairToDto} = require("../dtos/repair.dto");

module.exports = {
    async getAll(req, res) {
        const repairs = await Repair.findAll();
        res.json(repairs.map(repair => repairToDto(repair)));
    },

    async getById(req, res) {
        const repair = await Repair.findByPk(req.params.id);
        if (!repair) return res.status(404).json({error: 'Repair not found'});
        res.json(repairToDto(repair));
    },

    async create(req, res) {
        const newUser = await Repair.create(req.body);
        res.status(201).json(repairToDto(newUser));
    },

    async update(req, res) {
        const repair = await Repair.findByPk(req.params.id);
        if (!repair) return res.status(404).json({error: 'Repair not found'});
        await repair.update(req.body);
        res.json(repairToDto(repair));
    },

    async delete(req, res) {
        const repair = await Repair.findByPk(req.params.id);
        if (!repair) return res.status(404).json({error: 'Repair not found'});
        await repair.destroy();
        res.status(204).send();
    }
};
