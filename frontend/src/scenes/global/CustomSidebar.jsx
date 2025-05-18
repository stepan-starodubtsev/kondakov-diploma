import {useState} from "react";
import {Menu, MenuItem, Sidebar, SubMenu,} from "react-pro-sidebar";
import {Box, IconButton, Typography, useTheme} from "@mui/material";
import {Link, useLocation} from "react-router-dom";
import {tokens} from "../../theme";

import HomeOutlinedIcon from "@mui/icons-material/HomeOutlined";
import CarRentalIcon from '@mui/icons-material/CarRental';
import CarRepairIcon from '@mui/icons-material/CarRepair';
import DirectionsCarIcon from '@mui/icons-material/DirectionsCar';
import PersonOutlinedIcon from "@mui/icons-material/PersonOutlined";
import CalendarTodayOutlinedIcon from "@mui/icons-material/CalendarTodayOutlined";
import HelpOutlineOutlinedIcon from "@mui/icons-material/HelpOutlineOutlined";
import BarChartOutlinedIcon from "@mui/icons-material/BarChartOutlined";
import PieChartOutlineOutlinedIcon from "@mui/icons-material/PieChartOutlineOutlined";
import TimelineOutlinedIcon from "@mui/icons-material/TimelineOutlined";
import MenuOutlinedIcon from "@mui/icons-material/MenuOutlined";
import PeopleOutlinedIcon from "@mui/icons-material/PeopleOutlined";
import ScheduleIcon from '@mui/icons-material/Schedule';
import ApartmentIcon from '@mui/icons-material/Apartment';

const Item = ({title, to, icon}) => {
    const {pathname} = useLocation();
    return (
        <MenuItem
            active={pathname === to}
            icon={icon}
            component={<Link to={to}/>}
        >
            {title}
        </MenuItem>
    );
};

const CustomSidebar = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);
    const [isCollapsed, setIsCollapsed] = useState(false);

    return (
        <Box>
            <Sidebar
                collapsed={isCollapsed}
                backgroundColor={theme.palette.mode === "dark" ? colors.primary[400] : null}
                rootStyles={{
                    height: "100%",
                    border: "none",
                    minHeight: "100%",
                }}
            >
                <Menu
                    menuItemStyles={(theme.palette.mode === "dark") ? {
                        button: ({active}) => {
                            return {
                                color: active && colors.grey[400],
                                backgroundColor: colors.primary[400],
                                "&:hover": {
                                    color: "#868dfb",
                                    backgroundColor: colors.primary[500] + " !important",
                                }
                            }
                        },
                    } : {
                        button: ({active}) => {
                            return {
                                color: active && colors.grey[600],
                            }
                        },
                    }}>
                    <MenuItem
                        icon={isCollapsed ? <MenuOutlinedIcon/> : undefined}
                        onClick={() => setIsCollapsed(!isCollapsed)}
                        style={{margin: "10px 0 20px 0", color: colors.grey[100]}}
                    >
                        {!isCollapsed && (
                            <Box
                                display="flex"
                                justifyContent="space-between"
                                alignItems="center"
                                ml="15px"
                            >
                                <Typography variant="h3" color={colors.grey[100]}>
                                    Адмін панель
                                </Typography>
                                <IconButton onClick={() => setIsCollapsed(!isCollapsed)}>
                                    <MenuOutlinedIcon/>
                                </IconButton>
                            </Box>
                        )}
                    </MenuItem>

                    {!isCollapsed && (
                        <Box mb="25px">
                            <Box textAlign="center">
                                <Typography
                                    variant="h3"
                                    color={colors.grey[100]}
                                    fontWeight="bold"
                                    sx={{m: "10px 0 0 0"}}
                                >
                                    Kyrylo Bydanov
                                </Typography>
                                <Typography variant="h5" color={colors.greenAccent[500]}>
                                    admin@admin.com
                                </Typography>
                            </Box>
                        </Box>
                    )}

                    <Box pl={isCollapsed ? 0 : "10%"}>
                        <Item title="Головна" to="/" icon={<HomeOutlinedIcon/>}/>

                        <Item title="Користувачі" to="/users" icon={<PeopleOutlinedIcon/>}/>
                        <Item title="Підрозділи" to="/units" icon={<ApartmentIcon/>}/>

                        <SubMenu label="Про ТЗ" icon={<DirectionsCarIcon/>}>
                            <Item title="Список ТЗ" to="/vehicles" icon={<DirectionsCarIcon/>}/>
                            <Item title="Ремонти ТЗ" to="/repairs" icon={<CarRepairIcon/>}/>
                            <Item title="ТО ТЗ" to="/maintenances" icon={<CarRentalIcon/>}/>
                            <Item title="Облік пробігу" to="/mileage-logs" icon={<ScheduleIcon/>}/>
                        </SubMenu>

                        <Item title="Календар" to="/calendar" icon={<CalendarTodayOutlinedIcon/>}/>
                        <Item title="Профіль" to="/profile" icon={<PersonOutlinedIcon/>}/>
                    </Box>
                </Menu>
            </Sidebar>
        </Box>
    );
};

export default CustomSidebar;
