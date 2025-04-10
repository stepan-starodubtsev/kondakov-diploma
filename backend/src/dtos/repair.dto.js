function repairToDto(repair) {
    return {
        id: repair.id,
        vehicleId: repair.vehicleId,
        type: repair.type,
        date: repair.date,
        comment: repair.comment,
        workDescription: repair.workDescription,
        status: repair.status,
        editedByUserId: repair.editedByUserId,
        createdByUserId: repair.createdByUserId
    };
}

module.exports = { repairToDto };
