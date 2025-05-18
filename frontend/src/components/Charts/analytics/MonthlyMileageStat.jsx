import React from 'react';
import { observer } from 'mobx-react-lite';
import { Typography, useTheme } from '@mui/material';
import StatBox from '../../StatBox/StatBox.jsx'; // Переконайтеся, що шлях правильний
import SpeedIcon from '@mui/icons-material/Speed'; // Іконка для пробігу
import mileageLogsStore from '../../../stores/mileageLogsStore'; // Імпорт сховища
import { isDateInCurrentMonth } from '../../../utils/chartsUtils.js'; // Утиліта для перевірки дати
import { tokens } from "../../../theme"; // Ваші токени теми

const MonthlyMileageStat = observer(() => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);

    if (mileageLogsStore.loading) {
        return <Typography variant="caption">Завантаження...</Typography>;
    }

    // Фільтруємо записи пробігу за поточний місяць
    const monthlyMileageLogs = mileageLogsStore.mileageLogs.filter(log => isDateInCurrentMonth(log.date));

    // Сумуємо mileageDifference для відфільтрованих записів
    const totalMonthlyMileage = monthlyMileageLogs.reduce((sum, log) => {
        // Переконуємося, що mileageDifference є числом
        const difference = parseFloat(log.mileageDifference);
        return sum + (isNaN(difference) ? 0 : difference);
    }, 0);

    return (
        <StatBox
            title="Пробіг (місяць)"
            value={`${totalMonthlyMileage.toLocaleString()} км`} // Форматуємо число та додаємо "км"
            icon={<SpeedIcon sx={{ color: colors.purpleAccent ? colors.purpleAccent[500] : '#9C27B0', fontSize: "26px" }} />}
        />
    );
});

export default MonthlyMileageStat;