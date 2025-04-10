const {DataTypes} = require('sequelize');
const sequelize = require('../settings/settingsDB');
const User = require('./User');

const LogEntry = sequelize.define('LogEntry', {
    action: {type: DataTypes.STRING, allowNull: false},
    entityType: {type: DataTypes.STRING, allowNull: false},
    entityId: {type: DataTypes.INTEGER, allowNull: false},
    timestamp: {type: DataTypes.DATE, allowNull: false}
});

LogEntry.belongsTo(User, {foreignKey: 'userId'});

module.exports = LogEntry;
