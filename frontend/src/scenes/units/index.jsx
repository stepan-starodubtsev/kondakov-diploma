import Header from "../../components/Header.jsx";
import {Box, useTheme} from "@mui/material";
import {DataGrid, GridToolbar} from '@mui/x-data-grid';
import {tokens} from "../../theme.js";
import {mockDataContacts} from "../../data/mockData";
import {ukUA} from "@mui/x-data-grid/locales";
import {fetchUserById} from "../../services/UserService.js";

const Units = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);

    const columns = [
        {field: 'id', headerName: 'ID', flex: 0.5},
        {field: 'name', headerName: 'Назва підрозділу', flex: 1},
        {
            field: 'commanderId', headerName: 'Командир підрозділу', flex: 1, renderCell: ({row: {commanderId}}) => {
                return fetchUserById(commanderId);
            }
        },
    ]

    return (
        <Box m={"20px"}>
            <Box>
                <Header title={"ПІДРОЗДІЛИ"} subtitle={"Список підпорядкованих підрозділів"}/>
                <Box>
                    <DataGrid
                        sx={{
                            '& .MuiDataGrid-toolbarContainer': {
                                '& .MuiButton-root': {
                                    color: colors.grey[100],
                                },
                            },
                        }}
                        rows={mockDataContacts}
                        columns={columns}
                        slots={{toolbar: GridToolbar}}
                        localeText={ukUA.components.MuiDataGrid.defaultProps.localeText}
                        disableRowSelectionOnClick>
                    </DataGrid>
                </Box>
            </Box>
        </Box>
    )
        ;
}

export default Units;