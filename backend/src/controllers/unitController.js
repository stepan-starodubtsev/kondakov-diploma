const Unit = require('../models/Unit');
const {unitToDto} = require("../dtos/unit.dto");

module.exports = {
    async getAll(req, res) {
        const units = await Unit.findAll();
        res.json(units.map(unit => unitToDto(unit)));
    },

    async getById(req, res) {
        const unit = await Unit.findByPk(req.params.id);
        if (!unit) return res.status(404).json({error: 'Unit not found'});
        res.json(unitToDto(unit));
    },

    async create(req, res) {
        const newUser = await Unit.create(req.body);
        res.status(201).json(unitToDto(newUser));
    },

    async update(req, res) {
        const unit = await Unit.findByPk(req.params.id);
        if (!unit) return res.status(404).json({error: 'Unit not found'});
        await unit.update(req.body);
        res.json(unitToDto(unit));
    },

    async delete(req, res) {
        const unit = await Unit.findByPk(req.params.id);
        if (!unit) return res.status(404).json({error: 'Unit not found'});
        await unit.destroy();
        res.status(204).send();
    }
};
