const AppError = require("../middlewares/AppError");
const {getMileagesLogsByVehicleIdForThisYear} = require("../services/MileageLogService");
const {vehicleToDto} = require("./vehicle.dto");

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

function vehicleComponentToDto(component) {

    const vehicleComponentDTO = {
        id: component.id,
        name: component.name,
        componentType: component.componentType,
        manufacturerNumber: component.manufacturerNumber,
        manufacturedAt: component.manufacturedAt,
        mileageSinceManufactured: component.mileageSinceManufactured,
        mileageAfterLastRepair: component.mileageAfterLastRepair,
        annualResourceNorm: component.annualResourceNorm,
        annualResourceActual: calculateAnnualResourceActual(component),
        remainingAnnualResource: component.annualResourceNorm - component.annualResourceActual,
        conditionCategory: component.conditionCategory,
        maxResource: component.maxResource,
        remainingResourceToNextRepair: component.maxResource - component.mileageAfterLastRepair,
        needsMaintenance: false,
        needsCapitalRepair: false,
        vehicleId: component.vehicleId,
    };
    vehicleComponentDTO.needsMaintenance =
        vehicleComponentDTO.annualResourceActual > vehicleComponentDTO.annualResourceNorm;
    vehicleComponentDTO.needsCapitalRepair =
        vehicleComponentDTO.mileageSinceManufactured > vehicleComponentDTO.maxResource;
    if (vehicleComponentDTO.needsCapitalRepair) {
        vehicleComponentDTO.conditionCategory = '4';
    }

    return vehicleComponentDTO;
}


module.exports = {vehicleComponentToDto};