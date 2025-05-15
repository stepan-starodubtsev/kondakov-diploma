function repairToDto(repair) {
    return {
        id: repair.id,
        vehicleId: repair.vehicleId,
        type: repair.type,
        date: repair.date,
        repairReasonText: repair.repairReasonText,
        workDescription: repair.workDescription,
        editedByUserId: repair.editedByUserId,
        createdByUserId: repair.createdByUserId
    };
}

module.exports = { repairToDto };
