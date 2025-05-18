import {Box, IconButton, Tooltip, useTheme} from "@mui/material";
import {ColorModeContext, tokens} from "../../theme.js";
import {useContext} from "react";

import {DarkModeOutlined, LightModeOutlined, PersonOutlined} from '@mui/icons-material';
import {Link} from "react-router-dom";
import CalendarTodayOutlinedIcon from "@mui/icons-material/CalendarTodayOutlined";
import DirectionsCarIcon from "@mui/icons-material/DirectionsCar";

const TopBar = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);
    const colorMode = useContext(ColorModeContext);

    return (
        <Box display="flex" justifyContent="end" p={2}>
            <Box display="flex">
                <Tooltip title={'Змінити тему'}>
                    <IconButton onClick={colorMode.toggleColorMode}>
                        {theme.palette.mode === 'light' ?
                            <LightModeOutlined/> : <DarkModeOutlined/>}
                    </IconButton>
                </Tooltip>
                <Tooltip title={'Календаря'}>
                    <Link to={'/calendar'}>
                        <IconButton>
                            <CalendarTodayOutlinedIcon/>
                        </IconButton>
                    </Link>
                </Tooltip>
                <Tooltip title={'Список ТЗ'}>
                    <Link to={'/vehicles'}>
                        <IconButton>
                            <DirectionsCarIcon/>
                        </IconButton>
                    </Link>
                </Tooltip>
                <Tooltip title={'Профіль'}>
                    <IconButton>
                        <PersonOutlined/>
                    </IconButton>
                </Tooltip>
            </Box>
        </Box>
    );
}

export default TopBar;