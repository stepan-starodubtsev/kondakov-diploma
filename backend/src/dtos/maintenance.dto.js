function maintenanceToDto(maintenance) {
    return {
        id: maintenance.id,
        vehicleId: maintenance.vehicleId,
        type: maintenance.type,
        date: maintenance.date,
        result: maintenance.result,
        editedByUserId: maintenance.editedByUserId,
        createdByUserId: maintenance.createdByUserId
    };
}

module.exports = { maintenanceToDto };