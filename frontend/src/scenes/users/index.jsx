import Header from "../../components/Header.jsx";
import {Box, Button, Typography, useTheme} from "@mui/material";
import AdminPanelSettingsOutlinedIcon from "@mui/icons-material/AdminPanelSettingsOutlined";
import AccountBoxIcon from '@mui/icons-material/AccountBox';
import BadgeIcon from '@mui/icons-material/Badge';
import {DataGrid, GridToolbar} from '@mui/x-data-grid';
import {tokens} from "../../theme.js";
import {useEffect, useState} from "react";
import {fetchUsers} from "../../services/UserService.jsx";

const Team = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);
    const [usersData, setUsersData] = useState([]);

    const columns = [
        {field: 'id', headerName: 'ID'},
        {field: 'name', headerName: 'ПІБ', flex: 1, cellClassName: "name-column--cell"},
        {field: 'username', headerName: 'Логін', flex: 1},
        {
            field: 'role', headerName: 'Рівень доступу', flex: 1, renderCell: ({row: {access}}) => {
                return (
                    <Button
                        color={
                            access === "admin"
                                ? colors.greenAccent[600]
                                : access === "mainCommander"
                                    ? colors.greenAccent[700]
                                    : colors.greenAccent[700]
                        }
                    >
                        {access === "admin" && <AdminPanelSettingsOutlinedIcon/>}
                        {access === "mainCommander" && <AccountBoxIcon/>}
                        {access === "commander" && <BadgeIcon/>}
                        <Typography color={colors.grey[100]} sx={{ml: "5px"}}>
                            {access}
                        </Typography>
                    </Button>
                );
            },
        },
    ]

    useEffect(() => {
        handleUsersData();
    }, [])

    const handleUsersData = async () => {
        setUsersData(await fetchUsers());
    }

    return (
        <Box m={"20px"}>
            <Box>
                <Header title={"КОРИСТУВАЧІ"} subtitle={"Керування користувачами"}/>
                <Box>
                    <DataGrid
                        sx={{
                            '& .MuiDataGrid-toolbarContainer': {
                                '& .MuiButton-root': {
                                    color: colors.grey[100],
                                },
                            },
                        }}

                        rows={usersData}
                        columns={columns}
                        slots={{toolbar: GridToolbar}}
                        disableRowSelectionOnClick>
                    </DataGrid>
                </Box>
            </Box>
        </Box>
    )
        ;
}

export default Team;