import {useState} from "react";
import {
    Sidebar,
    Menu,
    MenuItem,
    SubMenu,
} from "react-pro-sidebar";
import {Box, IconButton, Typography, useTheme} from "@mui/material";
import {Link, useLocation} from "react-router-dom";
import {tokens} from "../../theme";

import HomeOutlinedIcon from "@mui/icons-material/HomeOutlined";
import PeopleOutlinedIcon from "@mui/icons-material/PeopleOutlined";
import ContactsOutlinedIcon from "@mui/icons-material/ContactsOutlined";
import ReceiptOutlinedIcon from "@mui/icons-material/ReceiptOutlined";
import PersonOutlinedIcon from "@mui/icons-material/PersonOutlined";
import CalendarTodayOutlinedIcon from "@mui/icons-material/CalendarTodayOutlined";
import HelpOutlineOutlinedIcon from "@mui/icons-material/HelpOutlineOutlined";
import BarChartOutlinedIcon from "@mui/icons-material/BarChartOutlined";
import PieChartOutlineOutlinedIcon from "@mui/icons-material/PieChartOutlineOutlined";
import TimelineOutlinedIcon from "@mui/icons-material/TimelineOutlined";
import MenuOutlinedIcon from "@mui/icons-material/MenuOutlined";
import MapOutlinedIcon from "@mui/icons-material/MapOutlined";
import UserPhoto from "../../assets/user.png";


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
                                    variant="h2"
                                    color={colors.grey[100]}
                                    fontWeight="bold"
                                    sx={{m: "10px 0 0 0"}}
                                >
                                    Ed Roh
                                </Typography>
                                <Typography variant="h5" color={colors.greenAccent[500]}>
                                    VP Fancy Admin
                                </Typography>
                            </Box>
                        </Box>
                    )}

                    <Box pl={isCollapsed ? 0 : "10%"}>
                        <Item title="Dashboard" to="/" icon={<HomeOutlinedIcon/>}/>


                        <SubMenu label="Data" icon={<ReceiptOutlinedIcon/>}>
                            <Item title="Manage Team" to="/team" icon={<PeopleOutlinedIcon/>}/>
                            <Item title="Contacts" to="/contacts" icon={<ContactsOutlinedIcon/>}/>
                            <Item title="Invoices" to="/invoices" icon={<ReceiptOutlinedIcon/>}/>
                        </SubMenu>

                        <SubMenu label="Pages" icon={<PersonOutlinedIcon/>}>
                            <Item title="Profile" to="/profile" icon={<PersonOutlinedIcon/>}/>
                            <Item title="Calendar" to="/calendar" icon={<CalendarTodayOutlinedIcon/>}/>
                            <Item title="FAQ" to="/faq" icon={<HelpOutlineOutlinedIcon/>}/>
                        </SubMenu>

                        <SubMenu label="Charts" icon={<BarChartOutlinedIcon/>}>
                            <Item title="Bar" to="/bar" icon={<BarChartOutlinedIcon/>}/>
                            <Item title="Pie" to="/pie" icon={<PieChartOutlineOutlinedIcon/>}/>
                            <Item title="Line" to="/line" icon={<TimelineOutlinedIcon/>}/>
                            <Item title="Geography" to="/geography" icon={<MapOutlinedIcon/>}/>
                        </SubMenu>
                    </Box>
                </Menu>
            </Sidebar>
        </Box>
    );
};

export default CustomSidebar;
