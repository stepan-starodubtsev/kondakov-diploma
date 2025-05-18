import React from 'react';
import { observer } from 'mobx-react-lite';
import GenericPieChart from './GenericPieChart';
import vehiclesStore from '../../stores/vehiclesStore';
import { aggregateDataForPieChart } from '../../utils/chartsUtils.js';
import { Typography } from '@mui/material';

const VehicleOperationGroupPieChart = observer(() => {
    if (vehiclesStore.loading) {
        return <Typography>Завантаження груп експлуатації...</Typography>;
    }
    const chartData = aggregateDataForPieChart(vehiclesStore.vehicles, 'operationGroup');

    return <GenericPieChart title="ТЗ за групою експлуатації" data={chartData} />;
});

export default VehicleOperationGroupPieChart;