function maintenanceToDto(maintenance) {
    return {
        id: maintenance.id,
        vehicleId: maintenance.vehicleId,
        type: maintenance.type,
        date: maintenance.date,
        isNeedRepair: maintenance.isNeedRepair,
        result: maintenance.result,
        status: maintenance.status,
        editedByUserId: maintenance.editedByUserId,
        createdByUserId: maintenance.createdByUserId
    };
}

module.exports = { maintenanceToDto };