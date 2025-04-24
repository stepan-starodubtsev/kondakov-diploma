const {DataTypes} = require('sequelize');
const sequelize = require('../settings/settingsDB');

const User = sequelize.define('User', {
    name: {type: DataTypes.STRING, allowNull: false},
    username: {type: DataTypes.STRING, allowNull: false},
    passwordHash: {type: DataTypes.STRING, allowNull: false},
    role: {type: DataTypes.ENUM('UNIT_COMMANDER', 'COMMANDER', 'ADMIN'), allowNull: false}
});

module.exports = User;
