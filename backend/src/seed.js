const sequelize = require('./config/settingsDB');



async function seed() {
    try {
        await sequelize.sync({ force: true }); // Clear DB and recreate tables with sample data

        // const unit = await Unit.create({
        //     name: '1-й танковий батальйон'
        // });
        //
        // const commander = await User.create({
        //     name: 'Командир Петров',
        //     username: 'petrov_cmd',
        //     passwordHash: 'hashedpassword1',
        //     role: 'commander',
        //     unitId: unit.id
        // });
        //
        // await unit.update({ commanderId: commander.id });
        //
        // const mechanic = await User.create({
        //     name: 'Інженер Сидоренко',
        //     username: 'sydorenko_mech',
        //     passwordHash: 'hashedpassword2',
        //     role: 'mechanic',
        //     unitId: unit.id
        // });
        //
        // const vehicle = await Vehicle.create({
        //     name: 'КамАЗ 4310',
        //     type: 'truck',
        //     licensePlate: 'AA1234BB',
        //     manufacturerNumber: 'KAM43101989',
        //     manufacturedAt: new Date('1990-01-01'),
        //     operationGroup: 'combat',
        //     mileageSinceManufactured: 45000,
        //     annualResourceNorm: 10000,
        //     conditionCategory: 'second',
        //     fuelType: 'diesel',
        //     oilType: 'M10',
        //     unitId: unit.id
        // });
        //
        // const engine = await VehicleComponent.create({
        //     vehicleId: vehicle.id,
        //     name: 'Двигун ЯМЗ-238',
        //     componentType: 'engine',
        //     manufacturerNumber: 'YMZ238ENG0001',
        //     manufacturedAt: new Date('1990-01-01'),
        //     mileageSinceManufactured: 20000,
        //     mileageAfterLastRepair: 5000,
        //     annualResourceNorm: 12000,
        //     maxResource: 30000,
        //     conditionCategory: 'second'
        // });
        //
        // await Maintenance.create({
        //     vehicleId: vehicle.id,
        //     type: 'TO1',
        //     date: new Date('2024-03-01'),
        //     isNeedRepair: false,
        //     result: 'ТО виконано',
        //     status: 'DONE',
        //     createdByUserId: mechanic.id,
        //     editedByUserId: mechanic.id
        // });
        //
        // const repair = await Repair.create({
        //     vehicleId: vehicle.id,
        //     type: 'current',
        //     date: new Date('2024-04-01'),
        //     comment: 'Поточний ремонт двигуна',
        //     workDescription: 'Заміна прокладки ГБЦ',
        //     status: 'DONE',
        //     createdByUserId: mechanic.id,
        //     editedByUserId: mechanic.id
        // });
        //
        // await RepairComponent.create({
        //     repairId: repair.id,
        //     vehicleComponentId: engine.id,
        //     workDescription: 'Заміна прокладки'
        // });
        //
        // await LogEntry.create({
        //     userId: mechanic.id,
        //     action: 'CREATE_REPAIR',
        //     entityType: 'Repair',
        //     entityId: repair.id,
        //     timestamp: new Date()
        // });

        console.log('Seed Done');
    } catch (error) {
        console.error('Seed Error:', error);
    } finally {
        await sequelize.close();
    }
}

seed();
