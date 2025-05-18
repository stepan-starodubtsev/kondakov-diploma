import React from 'react';
import { observer } from 'mobx-react-lite';
import GenericPieChart from './GenericPieChart';
import vehiclesStore from '../../stores/vehiclesStore';
import { aggregateDataForPieChart } from '../../utils/chartsUtils.js';
import { Typography } from '@mui/material';

const VehicleOilTypePieChart = observer(() => {
    if (vehiclesStore.loading) {
        return <Typography>Завантаження типів мастила...</Typography>;
    }
    const chartData = aggregateDataForPieChart(vehiclesStore.vehicles, 'oilType');

    return <GenericPieChart title="ТЗ за типом мастила" data={chartData} />;
});

export default VehicleOilTypePieChart;