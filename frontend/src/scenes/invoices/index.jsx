import Header from "../../components/Header.jsx";
import {Box, Typography, useTheme} from "@mui/material";
import {DataGrid, GridToolbar} from '@mui/x-data-grid';
import {tokens} from "../../theme.js";
import {mockDataInvoices} from "../../data/mockData";

const Invoices = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);

    const columns = [
        {field: 'id', headerName: 'ID', flex: 0.5},
        {field: 'name', headerName: 'Name', flex: 1, cellClassName: "name-column--cell"},
        {field: 'email', headerName: 'Email', flex: 1},
        {
            field: 'cost',
            headerName: 'Cost',
            flex: 1,
            renderCell: (params) => {
                <Typography color={colors.greenAccent[500]}>
                    ${params.row.cost}
                </Typography>
            }
        },
        {field: 'phone', headerName: 'Phone', flex: 1},
        {field: 'date', headerName: 'Date', flex: 1},
    ]

    return (
        <Box m={"20px"}>
            <Box>
                <Header title={"INVOICES"} subtitle={"List of Invoice Balances"}/>
                <Box>
                    <DataGrid
                        sx={{
                            "& .MuiCheckbox-root": {
                                color: colors.greenAccent[200] ,
                                "&.Mui-checked": {
                                    color: colors.greenAccent[200] ,
                                },
                            },
                            '& .MuiDataGrid-toolbarContainer': {
                                '& .MuiButton-root': {
                                    color: colors.grey[100],
                                },
                            },
                        }}
                        rows={mockDataInvoices}
                        columns={columns}
                        checkboxSelection
                        slots={{toolbar: GridToolbar}}
                        disableRowSelectionOnClick>
                    </DataGrid>
                </Box>
            </Box>
        </Box>
    )
        ;
}

export default Invoices;