const {DataTypes} = require('sequelize');
const sequelize = require('../settings/settingsDB');
const Unit = require('./Unit');

const Vehicle = sequelize.define('Vehicle', {
    name: {type: DataTypes.STRING, allowNull: false},
    type: {type: DataTypes.ENUM('passenger_car', 'bus', 'truck'), allowNull: false},
    licensePlate: {type: DataTypes.STRING, allowNull: false},
    manufacturerNumber: {type: DataTypes.STRING, allowNull: false},
    manufacturedAt: {type: DataTypes.DATEONLY, allowNull: false},
    operationGroup: {type: DataTypes.ENUM('combat', 'training', 'reserve'), allowNull: false},
    mileageSinceManufactured: {type: DataTypes.FLOAT, allowNull: false},
    annualResourceNorm: {type: DataTypes.FLOAT, allowNull: false},
    conditionCategory: {type: DataTypes.ENUM('1', '2', '3', '4', '5'), allowNull: false},
    fuelType: {type: DataTypes.ENUM('petrol', 'diesel'), allowNull: false},
    oilType: {type: DataTypes.ENUM('M8', 'M10', 'M10Г2', 'synthetic', 'mineral'), allowNull: false}
});

Vehicle.belongsTo(Unit, {foreignKey: 'unitId'});

module.exports = Vehicle;
