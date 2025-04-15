const Unit = require('../models/Unit');
const AppError = require("../errors/AppError");
const { unitToDto } = require("../dtos/unit.dto");

module.exports = {
    async createUnit(unitData) {
        const foundedUnit = await Unit.findOne({ where: { name: unitData.name } });
        if (foundedUnit) {
            throw new AppError(`This unit name is already in use`, 400);
        }

        const unit = await Unit.create(unitData);

        return unitToDto(unit);
    },

    async getAllUnits() {
        const units = await Unit.findAll();
        if (units.length === 0) {
            throw new AppError(`Units not found`, 404);
        }
        return units.map(unit => unitToDto(unit));
    },

    async getUnitById(id) {
        const unit = await Unit.findByPk(id);
        if (!unit) {
            throw new AppError(`Unit with ID ${id} not found`, 404);
        }
        return unitToDto(unit);
    },

    async updateUnit(id, updateData) {
        const unit = await Unit.findByPk(id);
        if (!unit) {
            throw new AppError(`Unit with ID ${id} not found`, 404);
        }

        await unit.update(updateData);
        return unitToDto(unit);
    },

    async deleteUnit(id) {
        const unit = await Unit.findByPk(id);
        if (!unit) {
            throw new AppError(`Unit with ID ${id} not found`, 404);
        }
        await unit.destroy();
        return { message: `Unit with ID ${id} deleted` };
    }
};
