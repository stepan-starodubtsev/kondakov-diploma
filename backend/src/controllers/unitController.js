const {unitToDto} = require("../dtos/unit.dto");
const {
    getAllUnits,
    getUnitById,
    createUnit,
    updateUnit,
    deleteUnit
} = require("../services/UnitService");

module.exports = {
    async getAll(req, res) {
        const unitDTOs = getAllUnits();
        res.json(unitDTOs);
    },

    async getById(req, res) {
        const unitDTO = getUnitById(req.params.id);
        res.json(unitToDto(unitDTO));
    },

    async create(req, res) {
        const newUnit = createUnit(req.body);
        res.status(201).json(newUnit);
    },

    async update(req, res) {
        const unitDTO = updateUnit(req.params.id, req.body);
        res.json(unitToDto(unitDTO));
    },

    async delete(req, res) {
        await deleteUnit(req.params.id);
        res.status(204).send();
    }
};
