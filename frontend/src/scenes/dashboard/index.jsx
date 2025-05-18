import React, {useEffect} from 'react';
import {observer} from 'mobx-react-lite';
import Header from "../../components/Header.jsx";
import {Box, Grid, Typography, useTheme, Paper, Stack} from "@mui/material";
import {tokens} from "../../theme.js";

// Імпорт сховищ (stores)
import vehiclesStore from '../../stores/vehiclesStore.js';
import repairsStore from '../../stores/repairsStore.js';
import maintenancesStore from '../../stores/maintenancesStore.js';

import VehicleTypePieChart from '../../components/charts/VehicleTypePieChart.jsx';
import VehicleFuelTypePieChart from '../../components/charts/VehicleFuelTypePieChart.jsx';
import VehicleOilTypePieChart from '../../components/charts/VehicleOilTypePieChart.jsx';
import VehicleOperationGroupPieChart from '../../components/charts/VehicleOperationGroupPieChart.jsx';
import TotalVehiclesStat from "../../components/Charts/analytics/TotalVehiclesStat.jsx";
import NeedsRepairStat from "../../components/Charts/analytics/NeedsRepairStat.jsx";
import NeedsMaintenanceStat from "../../components/Charts/analytics/NeedsMaintenanceStat.jsx";
import RepairsThisMonthStat from "../../components/Charts/analytics/RepairsThisMonthStat.jsx";
import MaintenancesThisMonthStat from "../../components/Charts/analytics/MaintenancesThisMonthStat.jsx";
import MonthlyMileageStat from "../../components/Charts/analytics/MonthlyMileageStat.jsx";
import TopBar from "../global/TopBar.jsx";
// import MaintenancesOverview from '../../components/analytics/MaintenancesOverview.jsx'; // Якщо використовується
// import RepairsByTypeChart from '../../components/charts/RepairsByTypeChart.jsx'; // Якщо використовується

const Dashboard = observer(() => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);

    useEffect(() => {
        if (!vehiclesStore.vehicles.length && !vehiclesStore.loading) vehiclesStore.loadVehicles();
        if (!repairsStore.repairs.length && !repairsStore.loading) repairsStore.loadRepairs();
        if (!maintenancesStore.maintenances.length && !maintenancesStore.loading) maintenancesStore.loadMaintenances();
    }, []);

    return (
        <>
            <TopBar headerBox={
                (<Box display="flex" alignItems="center" justifyContent="space-between">
                    <Header title="ГОЛОВНА ПАНЕЛЬ" subtitle="Огляд ключових показників"/>
                </Box>)
            }/>
            <Box m="20px">
                <Grid container spacing={1} mb={2}>
                    <Grid item size={4}>
                        <TotalVehiclesStat/>
                    </Grid>
                    <Grid item size={4}>
                        <NeedsRepairStat/>
                    </Grid>
                    <Grid item size={4}>
                        <NeedsMaintenanceStat/>
                    </Grid>
                    <Grid item size={4}>
                        <MonthlyMileageStat/>
                    </Grid>
                    <Grid item size={4}>
                        <RepairsThisMonthStat/>
                    </Grid>
                    <Grid item size={4}>
                        <MaintenancesThisMonthStat/>
                    </Grid>
                </Grid>

                {/* Рядок з діаграмами-пирогами по ТЗ */}
                <Grid container spacing={3} mb={3}>
                    <Grid item size={3}>
                        <VehicleTypePieChart/>
                    </Grid>
                    <Grid item size={3}>
                        <VehicleFuelTypePieChart/>
                    </Grid>
                    <Grid item size={3}>
                        <VehicleOilTypePieChart/>
                    </Grid>
                    <Grid item size={3}>
                        <VehicleOperationGroupPieChart/>
                    </Grid>
                </Grid>

                {/* Інші діаграми та аналітика */}
                {/*
            <Grid container spacing={3}>
                <Grid item xs={12} md={8}>
                    // Приклад: Діаграма стану ТЗ (якщо актуально, можна залишити VehicleStatusChart)
                    // <VehicleStatusChart />
                </Grid>
                <Grid item xs={12} md={4}>
                    // Приклад: Ремонти за типом
                    // <RepairsByTypeChart />
                </Grid>
                <Grid item xs={12}>
                    // Огляд технічного обслуговування
                    // <MaintenancesOverview />
                </Grid>
            </Grid>
            */}
            </Box>
        </>
    );
});

export default Dashboard;