const AppError = require("../middlewares/AppError");
const {getMileagesLogsByVehicleIdForThisYear} = require("../services/MileageLogService");

const calculateAnnualResourceActual = (component) => {
    const logs = getMileagesLogsByVehicleIdForThisYear(component.vehicleId);
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

const calculateConditionCategory = (vehicle) => {
    if(vehicle.conditionCategory < ) {

    }
}

function vehicleComponentToDto(component) {

    return {
        id: component.id,
        vehicleId: component.vehicleId,
        name: component.name,
        componentType: component.componentType,
        manufacturerNumber: component.manufacturerNumber,
        manufacturedAt: component.manufacturedAt,
        mileageSinceManufactured: component.mileageSinceManufactured,
        mileageAfterLastRepair: component.mileageAfterLastRepair,
        annualResourceNorm: component.annualResourceNorm,
        annualResourceActual: calculateAnnualResourceActual(component),
        remainingAnnualResource: component.annualResourceNorm - component.annualResourceActual,
        conditionCategory: component.conditionCategory, //todo
        maxResource: component.maxResource,
        remainingResourceToNextRepair: component.maxResource - component.mileageAfterLastRepair,
        needsRepair: component.needsRepair, //todo
        needsRepairType: component.needsRepairType, //todo
    };
}


module.exports = {vehicleComponentToDto};