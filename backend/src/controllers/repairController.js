const {repairToDto} = require("../dtos/repair.dto");
const {
    getAllRepairs,
    getRepairById,
    createRepair,
    updateRepair,
    deleteRepair
} = require("../services/RepairService");

module.exports = {
    async getAll(req, res) {
        const repairDTOs = await getAllRepairs();
        res.json(repairDTOs);
    },

    async getById(req, res) {
        const repairDTO = await getRepairById(req.params.id);
        res.json(repairToDto(repairDTO));
    },

    async create(req, res) {
        const newRepair = await createRepair(req.body);
        res.status(201).json(newRepair);
    },

    async update(req, res) {
        const repairDTO = await updateRepair(req.params.id, req.body);
        res.json(repairToDto(repairDTO));
    },

    async delete(req, res) {
        await deleteRepair(req.params.id);
        res.status(204).send();
    }
};