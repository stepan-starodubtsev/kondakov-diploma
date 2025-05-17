import {makeAutoObservable, runInAction} from 'mobx';
import {
    getMileageLogs,
    getMileageLogById,
    createMileageLog,
    updateMileageLog,
    deleteMileageLog,
} from '../services/mileageLogService';
import vehiclesStore from "./vehiclesStore.js";

class MileageLogsStore {
    mileageLogs = [];
    selectedMileageLog = null;
    loading = false;
    error = null;

    constructor() {
        makeAutoObservable(this);
        this.loadMileageLogs()
    }

    async loadMileageLogs() {
        this.loading = true;
        try {
            const data = await getMileageLogs();
            if (data) {
                runInAction(() => {
                    this.mileageLogs = data;
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

    async loadMileageLogById(mileageLogId) {
        try {
            const mileageLog = await getMileageLogById(mileageLogId);
            runInAction(() => {
                this.selectedMileageLog = mileageLog;
            });
        } catch (error) {
            this.error = error;
        }
    }

    async addMileageLog(newMileageLog) {
        try {
            const created = await createMileageLog(newMileageLog);
            runInAction(() => {
                this.mileageLogs.push(created);
            });

            await this.updateVehiclesMileage(created);
        } catch (error) {
            this.error = error;
        }
    }

    async removeMileageLog(mileageLogId) {
        try {
            await deleteMileageLog(mileageLogId);
            const deletedMileageLog = this.mileageLogs.find((mileageLog) => mileageLog.id === parseInt(mileageLogId));

            runInAction(() => {
                this.mileageLogs = this.mileageLogs.filter((u) => u.id !== mileageLogId);
            });

            await this.updateVehiclesMileage(deletedMileageLog);
        } catch (error) {
            this.error = error;
        }
    }

    async updateVehiclesMileage(mileageLog) {
        await vehiclesStore.loadVehicleById(mileageLog.vehicleId);
        const indexOfVehicle = vehiclesStore.indexOfVehicleById(mileageLog.vehicleId);
        vehiclesStore.vehicles[indexOfVehicle] = vehiclesStore.selectedVehicle;
    }
}

const mileageLogsStore = new MileageLogsStore();
export default mileageLogsStore;
