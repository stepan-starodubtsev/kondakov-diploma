const RepairComponent = require('../models/RepairComponent');
const {repairComponentToDto} = require("../dtos/repairComponent.dto");

module.exports = {
    async getAll(req, res) {
        const repairComponents = await RepairComponent.findAll();
        res.json(repairComponents.map(repairComponent => repairComponentToDto(repairComponent)));
    },

    async getById(req, res) {
        const repairComponent = await RepairComponent.findByPk(req.params.id);
        if (!repairComponent) return res.status(404).json({error: 'RepairComponent not found'});
        res.json(repairComponentToDto(repairComponent));
    },

    async create(req, res) {
        const newUser = await RepairComponent.create(req.body);
        res.status(201).json(repairComponentToDto(newUser));
    },

    async update(req, res) {
        const repairComponent = await RepairComponent.findByPk(req.params.id);
        if (!repairComponent) return res.status(404).json({error: 'RepairComponent not found'});
        await repairComponent.update(req.body);
        res.json(repairComponentToDto(repairComponent));
    },

    async delete(req, res) {
        const repairComponent = await RepairComponent.findByPk(req.params.id);
        if (!repairComponent) return res.status(404).json({error: 'RepairComponent not found'});
        await repairComponent.destroy();
        res.status(204).send();
    }
};
