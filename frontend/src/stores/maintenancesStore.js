import {makeAutoObservable, runInAction} from 'mobx';
import {
    getMaintenances,
    getMaintenanceById,
    createMaintenance,
    updateMaintenance,
    deleteMaintenance,
} from '../services/maintenanceService';

class MaintenancesStore {
    maintenances = [];
    selectedMaintenance = null;
    loading = false;
    error = null;

    constructor() {
        makeAutoObservable(this);
    }

    async loadMaintenances() {
        this.loading = true;
        try {
            const data = await getMaintenances();
            if (data) {
                runInAction(() => {
                    this.maintenances = data;
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

    async loadMaintenanceById(maintenanceId) {
        try {
            const maintenance = await getMaintenanceById(maintenanceId);
            runInAction(() => {
                this.selectedMaintenance = maintenance;
            });
        } catch (error) {
            this.error = error;
        }
    }

    async addMaintenance(newMaintenance) {
        try {
            const created = await createMaintenance(newMaintenance);
            runInAction(() => {
                this.maintenances.push(created);
            });
        } catch (error) {
            this.error = error;
        }
    }

    async updateMaintenance(maintenanceId, updatedMaintenance) {
        try {
            const updated = await updateMaintenance(maintenanceId, updatedMaintenance);
            runInAction(() => {
                this.maintenances = this.maintenances.map((u) =>
                    u.id === maintenanceId ? updated : u
                );
            });
        } catch (error) {
            this.error = error;
        }
    }

    async removeMaintenance(maintenanceId) {
        try {
            await deleteMaintenance(maintenanceId);
            runInAction(() => {
                this.maintenances = this.maintenances.filter((u) => u.id !== maintenanceId);
            });
        } catch (error) {
            this.error = error;
        }
    }
}

const maintenancesStore = new MaintenancesStore();
export default maintenancesStore;
