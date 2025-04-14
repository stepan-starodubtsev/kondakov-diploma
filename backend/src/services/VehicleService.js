const Vehicle = require('../models/Vehicle');
const AppError = require("../middlewares/AppError");
const {vehicleToDto} = require("../dtos/vehicle.dto");
const {updateVehicleComponentsMileage} = require("./VehicleComponentService");

module.exports = {
    async createVehicle(vehicleData) {
        const foundedVehicle = await Vehicle.findOne({where: {manufacturerNumber: vehicleData.manufacturerNumber}});
        if (foundedVehicle) {
            throw new AppError(`This vehicle manufacturer number is already in use`, 400);
        }

        const vehicle = await Vehicle.create(vehicleData);

        return vehicleToDto(vehicle);
    },

    async getAllVehicles() { //todo create prepareVehicleDTO
        const vehicles = await Vehicle.findAll();
        if (vehicles.length === 0) {
            throw new AppError(`Vehicles not found`, 404);
        }
        return vehicles.map(vehicle => vehicleToDto(vehicle));
    },

    async getVehicleById(id) {
        const vehicle = await Vehicle.findByPk(id);
        if (!vehicle) {
            throw new AppError(`Vehicle with ID ${id} not found`, 404);
        }
        return vehicleToDto(vehicle);
    },

    async updateVehicle(id, updateData) {
        const vehicle = await Vehicle.findByPk(id);
        if (!vehicle) {
            throw new AppError(`Vehicle with ID ${id} not found`, 404);
        }

        await vehicle.update(updateData);
        return vehicleToDto(vehicle);
    },

    async deleteVehicle(id) {
        const vehicle = await Vehicle.findByPk(id);
        if (!vehicle) {
            throw new AppError(`Vehicle with ID ${id} not found`, 404);
        }
        await vehicle.destroy();
        return {message: `Vehicle with ID ${id} deleted`};
    },

    updateVehicleMileage(vehicleId, mileage) {
        const vehicle = this.getVehicleById(vehicleId);
        updateVehicleComponentsMileage(vehicleId, mileage);
        return this.updateVehicle(vehicleId, {mileageSinceManufactured: mileage});
    }
};