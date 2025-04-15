import {Box, IconButton, InputBase, useTheme} from "@mui/material";
import {ColorModeContext, tokens} from "../../theme.js";
import {useContext} from "react";
import SearchIcon from '@mui/icons-material/Search';
import {
    DarkModeOutlined,
    LightModeOutlined,
    NotificationsOutlined,
    PersonOutlined,
    SettingsOutlined
} from '@mui/icons-material';
import {Link} from "react-router-dom";
import CalendarTodayOutlinedIcon from "@mui/icons-material/CalendarTodayOutlined";
import DirectionsCarIcon from "@mui/icons-material/DirectionsCar";

const TopBar = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);
    const colorMode = useContext(ColorModeContext);

    return (
        <Box display="flex" justifyContent="space-between" p={2}>
            <Box display="flex" backgroundColor={colors.primary[400]} borderRadius="3px">
                <InputBase sx={{ml: 2, flex: 1}} placeholder="Search"/>
                <IconButton type="button" sx={{p: 1}}>
                    <SearchIcon/>
                </IconButton>
            </Box>
            <Box display="flex">
                <IconButton onClick={colorMode.toggleColorMode}>
                    {theme.palette.mode === 'light' ?
                        <LightModeOutlined/> : <DarkModeOutlined/>}
                </IconButton>
                <Link to={'/calendar'}>
                    <IconButton>
                        <CalendarTodayOutlinedIcon/>
                    </IconButton>
                </Link>
                <Link to={'/cars'}>
                    <IconButton>
                        <DirectionsCarIcon/>
                    </IconButton>
                </Link>
                <IconButton>
                    <PersonOutlined/>
                </IconButton>
            </Box>
        </Box>);
}

export default TopBar;