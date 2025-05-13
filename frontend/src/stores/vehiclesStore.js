import {makeAutoObservable, runInAction} from 'mobx';
import {createVehicle, deleteVehicle, getVehicleById, getVehicles, updateVehicle,} from '../services/vehicleService';

class VehiclesStore {
    vehicles = [];
    tempVehicle = null;
    selectedVehicle = null;
    loading = false;
    error = null;

    constructor() {
        makeAutoObservable(this);
        this.loadVehicles()
        this.clearTempVehicle();
    }

    async loadVehicles() {
        this.loading = true;
        try {
            const data = await getVehicles();
            if (data) {
                runInAction(() => {
                    this.vehicles = data;
                });
            }
        } catch (error) {
            runInAction(() => {
                this.error = error;
            });
        } finally {
            this.loading = false;
        }
    }

    async loadVehicleById(vehicleId) {
        try {
            const vehicle = await getVehicleById(vehicleId);
            runInAction(() => {
                this.selectedVehicle = vehicle;
            });
        } catch (error) {
            this.error = error;
        }
    }

    async addVehicle() {
        try {
            const created = await createVehicle(this.prepareTempVehicleToSending(this.tempVehicle));
            runInAction(() => {
                this.vehicles.push(created);
            });
        } catch (error) {
            this.error = error;
        }
    }

    async updateVehicle(vehicleId) {
        try {
            const {conditionCategory, ...newVehicle} = this.tempVehicle;
            const updated = await updateVehicle(vehicleId, newVehicle);
            console.log('updated: ', updated);
            runInAction(() => {
                this.vehicles = this.vehicles.map((u) =>
                    u.id === vehicleId ? updated : u
                );
            });
        } catch (error) {
            this.error = error;
        }
    }

    async removeVehicle(vehicleId) {
        try {
            await deleteVehicle(vehicleId);
            runInAction(() => {
                this.vehicles = this.vehicles.filter((u) => u.id !== vehicleId);
            });
        } catch (error) {
            this.error = error;
        }
    }

    async removeVehicleComponent(vehicleComponentId) {
        runInAction(() => {
            this.tempVehicle.components = this.tempVehicle.components
                .filter((component) => component.id !== vehicleComponentId);
        });
    }

    setTempVehicle(vehicle) {
        runInAction(() => {
            this.tempVehicle = vehicle;
        });
    }

    findComponentById(vehicleComponentId) {
        return vehiclesStore.tempVehicle.components
            .find(vehicleComponent => vehicleComponent.id === parseInt(vehicleComponentId));
    }

    indexOfComponentById(vehicleComponentId) {
        return vehiclesStore.tempVehicle.components
            .findIndex((component) => component.id === parseInt(vehicleComponentId));
    }

    clearTempVehicle() {
        this.tempVehicle = {
            name: '',
            type: '',
            licensePlate: '',
            manufacturerNumber: '',
            manufacturedAt: '',
            operationGroup: '',
            mileageSinceManufactured: '',
            annualResourceNorm: '',
            conditionCategory: '',
            fuelType: '',
            oilType: '',
            components: [],
            unitId: '',
        };
    }

    prepareTempVehicleToSending(vehicle) {
        const {conditionCategory, ...newVehicle} = vehicle
        newVehicle.components = newVehicle.components.map((component) => {
            const {id, ...newComponent} = component;
            return newComponent;
        })
        return newVehicle;
    }
}

const vehiclesStore = new VehiclesStore();
export default vehiclesStore;
