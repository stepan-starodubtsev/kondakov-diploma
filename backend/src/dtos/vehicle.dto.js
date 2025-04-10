function vehicleToDto(vehicle) {
    return {
        id: vehicle.id,
        name: vehicle.name,
        type: vehicle.type,
        licensePlate: vehicle.licensePlate,
        manufacturerNumber: vehicle.manufacturerNumber,
        manufacturedAt: vehicle.manufacturedAt,
        operationGroup: vehicle.operationGroup,
        mileageSinceManufactured: vehicle.mileageSinceManufactured,
        annualResourceNorm: vehicle.annualResourceNorm,
        // annualResourceActual: vehicle., //todo
        conditionCategory: vehicle.conditionCategory,
        fuelType: vehicle.fuelType,
        oilType: vehicle.oilType,
        unitId: vehicle.unitId,
        annualResourceUsagePercent: vehicle.annualResourceNorm
            ? (vehicle.mileageSinceManufactured / vehicle.annualResourceNorm * 100).toFixed(1)
            : null
    };
}

module.exports = { vehicleToDto };