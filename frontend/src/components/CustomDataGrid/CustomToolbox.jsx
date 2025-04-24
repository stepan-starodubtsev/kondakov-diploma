import {GridToolbar} from "@mui/x-data-grid";
import {IconButton, Toolbar, Tooltip} from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import EditIcon from "@mui/icons-material/Edit";
import DeleteIcon from "@mui/icons-material/Delete";
import * as React from "react";

const CustomToolbar = ({handleAddButtonClick, handleEditButtonClick, handleDeleteButtonClick}) => {
    return (
        <Toolbar>
            <GridToolbar/>
            <div style={{marginLeft: 'auto'}}>
                <Tooltip title={'Додати'}>
                    <IconButton
                        onClick={handleAddButtonClick}
                        sx={{mr: 2}}
                    >
                        <AddIcon/>
                    </IconButton>
                </Tooltip>
                <Tooltip title={'Редагувати'}>
                    <IconButton
                        onClick={handleEditButtonClick}
                        sx={{mr: 2}}
                    >
                        <EditIcon/>
                    </IconButton>
                </Tooltip>
                <Tooltip title={'Видалити'}>
                    <IconButton
                        onClick={handleDeleteButtonClick}
                    >
                        <DeleteIcon/>
                    </IconButton>
                </Tooltip>
            </div>
        </Toolbar>
    );
};

export default CustomToolbar;