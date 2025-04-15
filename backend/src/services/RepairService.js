const Repair = require('../models/Repair');
const AppError = require("../middlewares/AppError");
const RepairComponent = require("../models/RepairComponent");
const {repairToDto} = require("../dtos/repair.dto");
const {updateVehicleComponentsCategory} = require("./VehicleComponentService");
const {getRepairComponentsByRepairId} = require("./RepairComponentService");

module.exports = {
    async createRepair(repairData) {
        const foundedRepair = await Repair.findOne({where: {vehicleId: repairData.vehicleId}});
        if (foundedRepair) {
            throw new AppError(`This repair is already in use by vehicle with id ${repairData.vehicleId}`, 400);
        }

        const componentIds = getRepairComponentsByRepairId(repairData.id)
            .map((repairComponent) => repairComponent.vehicleComponentId);
        let newCategory;
        if (repairData.type === 'capital') {
            newCategory = '4';
        } else {
            newCategory = '3';
        }
        await updateVehicleComponentsCategory(componentIds, newCategory);

        const repair = await Repair.create(repairData);

        return repairToDto(repair);
    },

    async getAllRepairs() {
        const repairs = await Repair.findAll();
        if (repairs.length === 0) {
            throw new AppError(`Repairs not found`, 404);
        }
        return repairs.map(repair => repairToDto(repair));
    },

    async getRepairById(id) {
        const repair = await Repair.findByPk(id);
        if (!repair) {
            throw new AppError(`Repair with ID ${id} not found`, 404);
        }
        return repairToDto(repair);
    },

    async getRepairsByVehicleId(vehicleId) {
        const repairs = await RepairComponent.findAll({where: vehicleId});
        if (repairs.length === 0) {
            throw new AppError(`Repairs not found`, 404);
        }
        return repairs.map(repair => repairToDto(repair));
    },

    async updateRepair(id, updateData) {
        const repair = await Repair.findByPk(id);
        if (!repair) {
            throw new AppError(`Repair with ID ${id} not found`, 404);
        }

        await repair.update(updateData);
        return repairToDto(repair);
    },

    async deleteRepair(id) {
        const repair = await Repair.findByPk(id);
        if (!repair) {
            throw new AppError(`Repair with ID ${id} not found`, 404);
        }
        await repair.destroy();
        return {message: `Repair with ID ${id} deleted`};
    }
};
