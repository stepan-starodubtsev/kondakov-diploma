const {DataTypes} = require('sequelize');
const sequelize = require('../settings/settingsDB');
const Vehicle = require('./Vehicle');
const User = require('./User');

const Maintenance = sequelize.define('Maintenance', {
    type: {
        type: DataTypes.ENUM('TO1', 'TO2', 'SR'),
        allowNull: false
    },
    date: {type: DataTypes.DATEONLY, allowNull: false},
    result: {type: DataTypes.TEXT, allowNull: true},
});

Maintenance.belongsTo(Vehicle, {foreignKey: 'vehicleId'});
Maintenance.belongsTo(User, {foreignKey: 'createdByUserId', as: 'createdBy'});
Maintenance.belongsTo(User, {foreignKey: 'editedByUserId', as: 'editedBy'});

module.exports = Maintenance;
