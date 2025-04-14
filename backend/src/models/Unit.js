const {DataTypes} = require('sequelize');
const sequelize = require('../settings/settingsDB');
const User = require('./User');

const Unit = sequelize.define('Unit', {
    name: {type: DataTypes.STRING, allowNull: false}
});

Unit.belongsTo(User, {foreignKey: 'commanderId'});

module.exports = Unit;
