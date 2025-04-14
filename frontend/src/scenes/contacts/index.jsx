import Header from "../../components/Header.jsx";
import {Box, useTheme} from "@mui/material";
import {DataGrid, GridToolbar} from '@mui/x-data-grid';
import {tokens} from "../../theme.js";
import {mockDataContacts} from "../../data/mockData";

const Contacts = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);

    const columns = [
        {field: 'id', headerName: 'ID', flex: 0.5},
        {field: 'registrarId', headerName: 'Registrar ID', flex: 1},
        {field: 'name', headerName: 'Name', flex: 1, cellClassName: "name-column--cell"},
        {field: 'email', headerName: 'Email', flex: 1},
        {field: 'age', headerName: 'Age', type: "number", headerAlign: "left", align: "left"},
        {field: 'phone', headerName: 'Phone', flex: 1},
        {field: 'address', headerName: 'Address', flex: 1},
        {field: 'city', headerName: 'City', flex: 1},
        {field: 'zipCode', headerName: 'ZipCode', flex: 1},
    ]

    return (
        <Box m={"20px"}>
            <Box>
                <Header title={"CONTACTS"} subtitle={"List of Contacts for Future Reference"}/>
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
                        disableRowSelectionOnClick>
                    </DataGrid>
                </Box>
            </Box>
        </Box>
    )
        ;
}

export default Contacts;