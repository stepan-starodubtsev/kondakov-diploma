import Header from "../../components/Header.jsx";
import {Box, useTheme} from "@mui/material";
import {tokens} from "../../theme.js";
import * as React from "react";
import {observer} from "mobx-react-lite";
import useError from "../../utils/useError.js";
import CustomDataGrid from "../../components/CustomDataGrid/CustomDataGrid.jsx";
import unitsStore from "../../stores/unitsStore.js";
import usersStore from "../../stores/usersStore.js";

const Units = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);
    const columns = [
        {field: 'id', headerName: 'ID'},
        {field: 'name', headerName: 'Назва підрозділу', flex: 1, cellClassName: "name-column--cell"},
        {
            field: 'commanderId',
            headerName: 'Командир',
            flex: 1,
            renderCell: (params) => {
                const commander = usersStore.users.find(user => user.id === params.value);
                return commander ? commander.name : '—';
            }
        }
    ];

    useError();

    return (
        <Box m={"20px"}>
            <Box>
                <Header title={"ПіДРОЗДІЛИ"} subtitle={"Керування підрозділами"}/>
                <Box>
                    <CustomDataGrid columns={columns}
                                    rows={unitsStore.units}
                                    addEntityUrl={"/units/create-unit"}
                                    editEntityUrl={"/units/edit-unit"}
                                    deleteHandler={unitsStore.removeUnit.bind(unitsStore)}

                    ></CustomDataGrid>
            </Box>
        </Box>
</Box>
)
    ;
}

export default observer(Units);