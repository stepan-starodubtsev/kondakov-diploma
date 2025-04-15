const VehicleComponent = require('../models/VehicleComponent');
const AppError = require("../middlewares/AppError");
const {vehicleComponentToDto} = require("../dtos/vehicleComponent.dto");
const {transaction} = require("../settings/settingsDB");

module.exports = {
    async createVehicleComponent(vehicleComponentData) {
        const foundedVehicleComponent = await VehicleComponent.findOne(
            {where: {manufacturerNumber: vehicleComponentData.manufacturerNumber}});
        if (foundedVehicleComponent) {
            throw new AppError(`This vehicle component manufacturer number is already in use`, 400);
        }

        const vehicleComponent = await VehicleComponent.create(vehicleComponentData);

        return vehicleComponentToDto(vehicleComponent);
    },

    async getAllVehicleComponents() {
        const vehicleComponents = await VehicleComponent.findAll();
        if (vehicleComponents.length === 0) {
            throw new AppError(`Vehicle components not found`, 404);
        }

        return vehicleComponents.map(
            vehicleComponent => vehicleComponentToDto(vehicleComponent));
    },

    async getVehicleComponentsByVehicleId(vehicleId) {
        const vehicleComponents = await VehicleComponent.findAll({where: {vehicleId: vehicleId}});
        if (vehicleComponents.length === 0) {
            throw new AppError(`Vehicle components with vehicle ID ${id} not found`, 404);
        }
        return vehicleComponentToDto(vehicleComponents);
    },

    async getVehicleComponentsByIds(ids) {
        const t = await transaction();
        let vehicleComponents;
        try {
            vehicleComponents = ids.map((id) => {
                VehicleComponent.findByPk(id, {transaction: t})
            });
        } catch (e) {
            console.error(e);
            throw new AppError('Something was wrong when vehicle components searching', 400);
        }
        if (vehicleComponents.length === 0) {
            throw new AppError(`Vehicle components not found`, 404);
        }
        return vehicleComponents.map(
            vehicleComponent => vehicleComponentToDto(vehicleComponent));
    },

    async getVehicleComponentById(id) {
        const vehicleComponent = await VehicleComponent.findByPk(id);
        if (!vehicleComponent) {
            throw new AppError(`Vehicle component with ID ${id} not found`, 404);
        }
        return vehicleComponentToDto(vehicleComponent);
    },

    async updateVehicleComponent(id, updateData) {
        const vehicleComponent = await VehicleComponent.findByPk(id);
        if (!vehicleComponent) {
            throw new AppError(`Vehicle component with ID ${id} not found`, 404);
        }

        await vehicleComponent.update(updateData);
        return vehicleComponentToDto(vehicleComponent);
    },

    async deleteVehicleComponent(id) {
        const vehicleComponent = await VehicleComponent.findByPk(id);
        if (!vehicleComponent) {
            throw new AppError(`Vehicle component with ID ${id} not found`, 404);
        }
        await vehicleComponent.destroy();
        return {message: `Vehicle component with ID ${id} deleted`};
    },

    async updateVehicleComponentsMileage(vehicleId, mileage) {
        const components = this.getVehicleComponentsByVehicleId(vehicleId);
        const t = await transaction();
        try {
            components.forEach((vehicleComponent) => {
                vehicleComponent.update(vehicleComponent.id,
                    {
                        mileageSinceManufactured: mileage,
                        mileageAfterLastRepair: vehicleComponent.mileageAfterLastRepair +
                            (mileage - vehicleComponent.mileageSinceManufactured),
                    }, {transaction: t});
            });
        } catch (e) {
            console.error(e);
            throw new AppError('Something was wrong when vehicle components searching', 400);
        }
        return components.map(component => vehicleComponentToDto(component));
    },
    async updateVehicleComponentsCategory(vehicleComponentIds, newCategory) {
        const components = this.getVehicleComponentsByIds(vehicleComponentIds);
        const t = await transaction();
        try {
            components.forEach((vehicleComponent) => {
                vehicleComponent.update(vehicleComponent.id,
                    {
                        category: newCategory,
                    }, {transaction: t});
            });
        } catch (e) {
            console.error(e);
            throw new AppError('Something was wrong when vehicle components searching', 400);
        }
        return components.map(component => vehicleComponentToDto(component));
    },
};