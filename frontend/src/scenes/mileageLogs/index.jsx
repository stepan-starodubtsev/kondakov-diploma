import Header from "../../components/Header.jsx";
import {Box, useTheme} from "@mui/material";
import {tokens} from "../../theme.js";
import * as React from "react";
import {observer} from "mobx-react-lite";
import useError from "../../utils/useError.js";
import CustomDataGrid from "../../components/CustomDataGrid/CustomDataGrid.jsx";
import mileageLogsStore from "../../stores/mileageLogsStore.js";
import vehiclesStore from "../../stores/vehiclesStore.js";

const MileageLogs = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);
    const columns = [
        {field: 'id', headerName: 'ID'},
        {
            field: 'vehicleId', headerName: 'Транспортний засіб', renderCell: (params) => {
                const vehicle = vehiclesStore.vehicles.find(vehicles => vehicles.id === params.value);
                return vehicle ? vehicle.name : '—';
            }
        },
        {field: 'date', headerName: 'Дата проведення ТО'},
        {field: 'mileage', headerName: 'Пробіг на момент запису'},
    ];

    useError();

    return (
        <Box m={"20px"}>
            <Box>
                <Header title={"ЗВІТИ ПРО ПРОБІГ"} subtitle={"Керування звітами про пробіг транспортних засобів"}/>
                <Box>
                    <CustomDataGrid columns={columns}
                                    rows={mileageLogsStore.mileageLogs}
                                    addEntityUrl={"/mileage-logs/create-mileage-log"}
                                    editEntityUrl={"/mileage-logs/edit-mileage-log"}
                                    deleteHandler={mileageLogsStore.removeMileageLog.bind(mileageLogsStore)}

                    ></CustomDataGrid>
            </Box>
        </Box>
</Box>
)
    ;
}

export default observer(MileageLogs);