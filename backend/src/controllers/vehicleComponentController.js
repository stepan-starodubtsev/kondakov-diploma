const {vehicleComponentToDto} = require("../dtos/vehicleComponent.dto");
const {
    getAllVehicleComponents,
    getVehicleComponentById,
    createVehicleComponent,
    updateVehicleComponent,
    deleteVehicleComponent
} = require("../services/VehicleComponentService");

module.exports = {
    async getAll(req, res) {
        const vehicleComponentDTOs = getAllVehicleComponents();
        res.json(vehicleComponentDTOs);
    },

    async getById(req, res) {
        const vehicleComponentDTO = getVehicleComponentById(req.params.id);
        res.json(vehicleComponentToDto(vehicleComponentDTO));
    },

    async create(req, res) {
        const newVehicleComponent = createVehicleComponent(req.body);
        res.status(201).json(newVehicleComponent);
    },

    async update(req, res) {
        const vehicleComponentDTO = updateVehicleComponent(req.params.id, req.body);
        res.json(vehicleComponentToDto(vehicleComponentDTO));
    },

    async delete(req, res) {
        await deleteVehicleComponent(req.params.id);
        res.status(204).send();
    }
};
