import React from 'react';
import { observer } from 'mobx-react-lite';
import GenericPieChart from './GenericPieChart';
import vehiclesStore from '../../stores/vehiclesStore';
import { aggregateDataForPieChart } from '../../utils/chartsUtils.js';
import { Typography } from '@mui/material';

const VehicleTypePieChart = observer(() => {
    if (vehiclesStore.loading) {
        return <Typography>Завантаження типів ТЗ...</Typography>;
    }
    const chartData = aggregateDataForPieChart(vehiclesStore.vehicles, 'type');

    return <GenericPieChart title="ТЗ за типом" data={chartData} />;
});

export default VehicleTypePieChart;