const {
    getAllRepairComponents,
    getRepairComponentById,
    createRepairComponent,
    deleteRepairComponent
} = require("../services/RepairComponentService");
const {updateRepairComponent} = require("../services/RepairComponentService");
const {repairComponentToDto} = require("../dtos/repairComponent.dto");

module.exports = {
    async getAll(req, res) {
        const repairComponentDTOs = getAllRepairComponents();
        res.json(repairComponentDTOs);
    },

    async getById(req, res) {
        const repairComponentDTO = getRepairComponentById(req.params.id);
        res.json(repairComponentToDto(repairComponentDTO));
    },

    async create(req, res) {
        const newRepairComponent = createRepairComponent(req.body);
        res.status(201).json(newRepairComponent);
    },

    async update(req, res) {
        const repairComponentDTO = updateRepairComponent(req.params.id, req.body);
        res.json(repairComponentToDto(repairComponentDTO));
    },

    async delete(req, res) {
        await deleteRepairComponent(req.params.id);
        res.status(204).send();
    }
};
