import Header from "../../components/Header.jsx";
import {Box, Button, Typography, useTheme} from "@mui/material";
import AdminPanelSettingsOutlinedIcon from "@mui/icons-material/AdminPanelSettingsOutlined";
import LockOpenOutlinedIcon from "@mui/icons-material/LockOpenOutlined";
import SecurityOutlinedIcon from "@mui/icons-material/SecurityOutlined";
import {DataGrid, GridToolbar} from '@mui/x-data-grid';
import {tokens} from "../../theme.js";
import {mockDataTeam} from "../../data/mockData";

const Team = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);

    const columns = [
        {field: 'id', headerName: 'ID'},
        {field: 'name', headerName: 'Name', flex: 1, cellClassName: "name-column--cell"},
        {field: 'email', headerName: 'Email', flex: 1},
        {field: 'age', headerName: 'Age', type: "number", headerAlign: "left", align: "left"},
        {field: 'phone', headerName: 'Phone', flex: 1},
        {
            field: 'access', headerName: 'Access', flex: 1, renderCell: ({row: {access}}) => {
                return (
                    <Button
                        color={
                            access === "admin"
                                ? colors.greenAccent[600]
                                : access === "manager"
                                    ? colors.greenAccent[700]
                                    : colors.greenAccent[700]
                        }
                    >
                        {access === "admin" && <AdminPanelSettingsOutlinedIcon/>}
                        {access === "manager" && <SecurityOutlinedIcon/>}
                        {access === "user" && <LockOpenOutlinedIcon/>}
                        <Typography color={colors.grey[100]} sx={{ml: "5px"}}>
                            {access}
                        </Typography>
                    </Button>
                );
            },
        },
    ]

    return (
        <Box m={"20px"}>
            <Box>
                <Header title={"TEAM"} subtitle={"Managing the Team members"}/>
                <Box>
                    <DataGrid
                        sx={{
                            '& .MuiDataGrid-toolbarContainer': {
                                '& .MuiButton-root': {
                                    color: colors.grey[100],
                                },
                            },
                        }}

                        rows={mockDataTeam}
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