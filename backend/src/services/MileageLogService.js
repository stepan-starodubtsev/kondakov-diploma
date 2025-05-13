const AppError = require("../errors/AppError");
const MileageLog = require("../models/MileageLog");
const {updateVehicleMileage} = require("./VehicleService");
const {Op} = require("sequelize");

module.exports = {
    async createMileageLog(mileageLogData) {
        const mileageLog = await MileageLog.create(mileageLogData);
        updateVehicleMileage(mileageLogData.vehicleId, mileageLogData.mileage);
        return mileageLog;
    },

    async getAllMileageLogs() {
        const mileageLogs = await MileageLog.findAll();
        if (mileageLogs.length === 0) {
            return null;
        }
        return mileageLogs;
    },

    async getMileagesLogsByVehicleIdForThisYear(vehicleId) {
        const startOfYear = new Date().getFullYear();
        const mileageLogs = await MileageLog.findAll({
            where: {
                vehicleId,
                createdAt: {
                    [Op.gte]: startOfYear,
                },
            },
            order: [['createdAt', 'ASC']],
        });
        if (mileageLogs.length === 0) {
            return null;
        }
        return mileageLogs;
    },

    async getMileageLogById(id) {
        const mileageLog = await MileageLog.findByPk(id);
        if (!mileageLog) {
            throw new AppError(`MileageLog with ID ${id} not found`, 404);
        }
        return mileageLog;
    },




    async deleteMileageLog(id) {
        const mileageLog = await MileageLog.findByPk(id);
        if (!mileageLog) {
            throw new AppError(`MileageLog with ID ${id} not found`, 404);
        }
        await mileageLog.destroy();
        return { message: `MileageLog with ID ${id} deleted` };
    }
};
