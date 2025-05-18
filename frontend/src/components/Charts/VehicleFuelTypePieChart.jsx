import React from 'react';
import { observer } from 'mobx-react-lite';
import GenericPieChart from './GenericPieChart';
import vehiclesStore from '../../stores/vehiclesStore';
import { aggregateDataForPieChart } from '../../utils/chartsUtils.js';
import { Typography } from '@mui/material';

const VehicleFuelTypePieChart = observer(() => {
    if (vehiclesStore.loading) {
        return <Typography>Завантаження типів палива...</Typography>;
    }
    const chartData = aggregateDataForPieChart(vehiclesStore.vehicles, 'fuelType');

    return <GenericPieChart title="ТЗ за типом палива" data={chartData} />;
});

export default VehicleFuelTypePieChart;