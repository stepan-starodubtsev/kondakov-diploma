const {getVehicleComponentsByVehicleId} = require("../services/VehicleComponentService");
const getAnnualResourceActual = (vehicle) => {
    const components = getVehicleComponentsByVehicleId(vehicle.id);
    if (components.length === 0) {
        return null;
    }
    return
};

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
        annualResourceActual: getAnnualResourceActual(vehicle),
        remainingAnnualResource: vehicle.annualResourceNorm - vehicle.annualResourceActual,
        conditionCategory: vehicle.conditionCategory, //todo
        fuelType: vehicle.fuelType,
        oilType: vehicle.oilType,
        unitId: vehicle.unitId,
        // remainingResourceToNextRepair: ,//todo
        // // needsRepair = vehicle.needsRepair, //todo
        // // needsRepairType = vehicle.needsRepairType, //todo
    };
}

module.exports = {vehicleToDto};