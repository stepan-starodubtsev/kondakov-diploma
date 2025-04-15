const {getVehicleComponentsByVehicleId} = require("../services/VehicleComponentService");
const {getMileagesLogsByVehicleIdForThisYear} = require("../services/MileageLogService");
const AppError = require("../errors/AppError");

const calculateAnnualResourceActual = (vehicle) => {
    const logs = getMileagesLogsByVehicleIdForThisYear(vehicle.id);
    if (logs.length < 2) {
        if (logs.length === 1) {
            return logs[0];
        } else {
            throw new AppError(`Mileages logs not found`, 404);
        }
    }

    const firstMileage = logs[0].mileage;
    const lastMileage = logs[logs.length - 1].mileage;

    return lastMileage - firstMileage;
}

const getConditionCategory = (vehicle, vehicleComponents) => {
    const vehicleComponentsCategories = vehicleComponents.map((vehicleComponent) => {
        return vehicleComponent.conditionCategory
    });

    return  vehicleComponentsCategories.sort((a, b) => {b - a})[0];
}


const getNeedsMaintenance = (vehicle, vehicleComponents) => {
    return vehicleComponents.some((vehicleComponent) => {
        return vehicleComponent.needsMaintenance
    });
};

const getNeedsCapitalRepair = (vehicle, vehicleComponents) => {
    return vehicleComponents.some((vehicleComponent) => {
        return vehicleComponent.needsCapitalRepair
    });
};

const getRemainingResourceToNextRepair = (vehicle, vehicleComponents) => {
    const vehicleComponentsRemainingResources = vehicleComponents.map((vehicleComponent) => {
        return vehicleComponent.remainingResourceToNextRepair
    });

    return  vehicleComponentsRemainingResources.sort((a, b) => {b - a})[0];
}

function vehicleToDto(vehicle) {

    const vehicleDTO = {
        id: vehicle.id,
        name: vehicle.name,
        type: vehicle.type,
        licensePlate: vehicle.licensePlate,
        manufacturerNumber: vehicle.manufacturerNumber,
        manufacturedAt: vehicle.manufacturedAt,
        operationGroup: vehicle.operationGroup,
        mileageSinceManufactured: vehicle.mileageSinceManufactured,
        annualResourceNorm: vehicle.annualResourceNorm,
        annualResourceActual: null,
        remainingAnnualResource: vehicle.annualResourceNorm - vehicle.annualResourceActual,
        conditionCategory: vehicle.conditionCategory,
        fuelType: vehicle.fuelType,
        oilType: vehicle.oilType,
        remainingResourceToNextRepair: null,
        needsMaintenance: false,
        needsCapitalRepair: false,
        unitId: vehicle.unitId,
    };
    const components = getVehicleComponentsByVehicleId(vehicle.id);
    vehicle.annualResourceActual = calculateAnnualResourceActual(vehicle);
    vehicle.conditionCategory = getConditionCategory(vehicle, components);
    vehicle.remainingResourceToNextRepair = getRemainingResourceToNextRepair(vehicle, components);
    vehicle.needsMaintenance = getNeedsMaintenance(vehicle, components)
        || vehicle.annualResourceActual > vehicle.annualResourceNorm;
    vehicle.needsCapitalRepair = getNeedsCapitalRepair(vehicle, components);

    return vehicleDTO;
}

module.exports = {vehicleToDto};