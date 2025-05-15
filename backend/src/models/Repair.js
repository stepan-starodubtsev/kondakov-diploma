const {DataTypes} = require('sequelize');
const sequelize = require('../settings/settingsDB');
const User = require('./User');
const Vehicle = require('./Vehicle');

const Repair = sequelize.define('Repair', {
    type: {
        type: DataTypes.ENUM('unplanned', 'current', 'medium', 'capital'),
        allowNull: false
    },
    date: {type: DataTypes.DATEONLY, allowNull: false},
    comment: {type: DataTypes.TEXT, allowNull: true},
    workDescription: {type: DataTypes.TEXT, allowNull: true},
});

Repair.belongsTo(Vehicle, {foreignKey: 'vehicleId'});
Repair.belongsTo(User, {foreignKey: 'createdByUserId', as: 'createdBy'});
Repair.belongsTo(User, {foreignKey: 'editedByUserId', as: 'editedBy'});

module.exports = Repair;
