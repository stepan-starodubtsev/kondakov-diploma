const Vehicle = require('../models/Vehicle');
const VehicleComponent = require('../models/VehicleComponent');
const AppError = require("../errors/AppError");
const {
    updateVehicleComponentsMileage,
    getVehicleComponentsByVehicleId, updateVehicleComponent, getAllVehicleComponents
} = require("./VehicleComponentService");
const sequelize = require("../settings/settingsDB");

module.exports = {
    async createVehicle(vehicleData) {
        const transaction = await  sequelize.transaction();

        try {
            const existingVehicle = await Vehicle.findOne({
                where: { manufacturerNumber: vehicleData.manufacturerNumber },
                transaction,
            });

            if (existingVehicle) {
                throw new AppError(`This vehicle manufacturer number is already in use`, 400);
            }

            let { components, ...vehicle } = vehicleData;

            const newVehicle = await Vehicle.create(vehicle, { transaction });

            components = await Promise.all(
                components.map(component => {
                    component.vehicleId = newVehicle.id;
                    return VehicleComponent.create(component, { transaction });
                })
            );

            await transaction.commit();

            return { components, ...newVehicle.get({ plain: true }) };
        } catch (error) {
            await transaction.rollback();
            throw error;
        }
    },

    async getAllVehicles() {
        const vehicles = await Vehicle.findAll();
        if (vehicles.length === 0) {
            return null;
        }
        return vehicles;
    },

    async getVehicleById(id) {
        const vehicle = await Vehicle.findByPk(id);
        if (!vehicle) {
            throw new AppError(`Vehicle with ID ${id} not found`, 404);
        }
        vehicle.components = getVehicleComponentsByVehicleId(vehicle.id);
        return vehicle;
    },

    async updateVehicle(id, updateData) {
        const foundedVehicle = await Vehicle.findByPk(id);
        if (!foundedVehicle) {
            throw new AppError(`Vehicle with ID ${id} not found`, 404);
        }

        let {components, ...vehicle} = updateData;
        const newVehicle = await foundedVehicle.update(vehicle);
        components = components.forEach(component => {
            updateVehicleComponent(component.id, component);
        });
        return {components, ...newVehicle};
    },

    async deleteVehicle(id) {
        const vehicle = await Vehicle.findByPk(id);
        if (!vehicle) {
            throw new AppError(`Vehicle with ID ${id} not found`, 404);
        }
        (await getVehicleComponentsByVehicleId(vehicle.id)).forEach(component => component.destroy());
        await vehicle.destroy();
        return {message: `Vehicle with ID ${id} deleted`};
    },

    updateVehicleMileage(vehicleId, mileage) {
        updateVehicleComponentsMileage(vehicleId, mileage);
        return this.updateVehicle(vehicleId, {mileageSinceManufactured: mileage});
    }
};