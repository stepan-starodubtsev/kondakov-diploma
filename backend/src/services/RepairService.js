const Repair = require('../models/Repair');
const AppError = require("../errors/AppError");
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

        return await Repair.create(repairData);
    },

    async getAllRepairs() {
        const repairs = await Repair.findAll();
        if (repairs.length === 0) {
            return null;
        }
        return repairs;
    },

    async getRepairById(id) {
        const repair = await Repair.findByPk(id);
        if (!repair) {
            throw new AppError(`Repair with ID ${id} not found`, 404);
        }
        return repair;
    },

    async getRepairsByVehicleId(vehicleId) {
        const repairs = await Repair.findAll({where: vehicleId});
        if (repairs.length === 0) {
            return null;
        }
        return repairs;
    },

    async updateRepair(id, updateData) {
        const repair = await Repair.findByPk(id);
        if (!repair) {
            throw new AppError(`Repair with ID ${id} not found`, 404);
        }

        await repair.update(updateData);
        return repair;
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
