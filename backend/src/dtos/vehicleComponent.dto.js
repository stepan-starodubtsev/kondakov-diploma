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
        maxResource: component.maxResource,
        conditionCategory: component.conditionCategory,
        remainingResource: component.maxResource
            ? component.maxResource - component.mileageSinceManufactured
            : null
    };
}

module.exports = { vehicleComponentToDto };