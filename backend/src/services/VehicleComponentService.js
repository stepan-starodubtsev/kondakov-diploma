const VehicleComponent = require('../models/VehicleComponent');
const AppError = require("../errors/AppError");
const {transaction} = require("../settings/settingsDB");

module.exports = {
    async createVehicleComponent(vehicleComponentData) {
        const foundedVehicleComponent = await VehicleComponent.findOne(
            {where: {manufacturerNumber: vehicleComponentData.manufacturerNumber}});
        if (foundedVehicleComponent) {
            throw new AppError(`This vehicle component manufacturer number is already in use`, 400);
        }

        return await VehicleComponent.create(vehicleComponentData);
    },

    async getAllVehicleComponents() {
        const vehicleComponents = await VehicleComponent.findAll();
        if (vehicleComponents.length === 0) {
            return null;
        }

        return vehicleComponents;
    },

    async getVehicleComponentsByVehicleId(vehicleId) {
        const vehicleComponents = await VehicleComponent.findAll({where: {vehicleId: vehicleId}});
        if (vehicleComponents.length === 0) {
            return null;
        }
        return vehicleComponents;
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
            return null;
        }
        return vehicleComponents;
    },

    async getVehicleComponentById(id) {
        const vehicleComponent = await VehicleComponent.findByPk(id);
        if (!vehicleComponent) {
            throw new AppError(`Vehicle component with ID ${id} not found`, 404);
        }
        return vehicleComponent;
    },

    async updateVehicleComponent(id, updateData) {
        const vehicleComponent = await VehicleComponent.findByPk(id);
        if (!vehicleComponent) {
            throw new AppError(`Vehicle component with ID ${id} not found`, 404);
        }

        await vehicleComponent.update(updateData);
        return vehicleComponent;
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
        return components;
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
        return components;
    },
};