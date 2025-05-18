import {ColorModeContext, useMode} from "./theme.js";
import {CssBaseline, ThemeProvider, Typography} from "@mui/material";
import {Navigate, Route, Routes} from "react-router-dom";
import {observer} from 'mobx-react-lite';
import authStore from './stores/authStore';
import {ROLES} from './utils/constants.js';
import CustomSideBar from "./scenes/global/CustomSidebar.jsx";
import Topbar from "./scenes/global/Topbar.jsx";
import Dashboard from "./scenes/dashboard";
import Users from "./scenes/users";
import UserForm from "./scenes/users/UserForm.jsx";
import Units from "./scenes/units/index.jsx";
import UnitForm from "./scenes/units/UnitForm.jsx";
import Vehicles from "./scenes/vehicles/index.jsx";
import VehicleForm from "./scenes/vehicles/VehicleForm.jsx";
import VehicleComponentForm from "./scenes/vehicles/VehicleComponentForm.jsx";
import Repairs from "./scenes/repairs/index.jsx";
import RepairComponentForm from "./scenes/repairs/RepairComponentForm.jsx";
import RepairForm from "./scenes/repairs/RepairForm.jsx";
import Maintenances from "./scenes/maintenances/index.jsx";
import MaintenanceForm from "./scenes/maintenances/MaintenanceForm.jsx";
import MileageLogs from "./scenes/mileageLogs/index.jsx";
import MileageLogForm from "./scenes/mileageLogs/MileageLogForm.jsx";
import Calendar from "./scenes/calendar";
import ProfileForm from "./scenes/profile/index.jsx";
import LoginPage from './scenes/LoginPage/LoginPage.jsx';
import ProtectedRoute from './components/auth/ProtectedRoute/ProtectedRoute.jsx';

const App = observer(() => {
    const [theme, colorMode] = useMode();

    return (
        <ColorModeContext.Provider value={colorMode}>
            <ThemeProvider theme={theme}>
                <CssBaseline/>
                <div className="app">
                    {authStore.isAuthenticated && <CustomSideBar/>}
                    <main className="content">
                        {authStore.isAuthenticated && <Topbar/>}
                        <Routes>
                            <Route
                                path="/login"
                                element={!authStore.isAuthenticated ? <LoginPage/> : <Navigate to="/" replace/>}
                            />

                            {/* ADMIN Routes */}
                            <Route element={<ProtectedRoute allowedRoles={[ROLES.ADMIN]}/>}>
                                <Route path="/users" element={<Users/>}/>
                                <Route path="/users/create-user" element={<UserForm/>}/>
                                <Route path="/users/edit-user/:userId" element={<UserForm/>}/>

                                <Route path="/units" element={<Units/>}/>
                                <Route path="/units/create-unit" element={<UnitForm/>}/>
                                <Route path="/units/edit-unit/:unitId" element={<UnitForm/>}/>
                                <Route path="/profile" element={<ProfileForm/>}/>
                            </Route>

                            {/* DUTY_STAFF Routes */}
                            <Route element={<ProtectedRoute allowedRoles={[ROLES.DUTY_STAFF]}/>}>
                                <Route path="/mileage-logs" element={<MileageLogs/>}/>
                                <Route path="/mileage-logs/create-mileage-log" element={<MileageLogForm/>}/>
                                <Route path="/mileage-logs/edit-mileage-log/:mileageLogId" element={<MileageLogForm/>}/>
                                <Route path="/profile" element={<ProfileForm/>}/>
                            </Route>

                            {/* COMMANDER Routes */}
                            <Route element={<ProtectedRoute allowedRoles={[ROLES.COMMANDER]}/>}>
                                <Route path="/vehicles" element={<Vehicles/>}/>
                                <Route path="/repairs" element={<Repairs/>}/>
                                <Route path="/maintenances" element={<Maintenances/>}/>
                                <Route path="/mileage-logs" element={<MileageLogs/>}/>
                                <Route path="/" element={<Dashboard/>}/>
                                <Route path="/calendar" element={<Calendar/>}/>
                                <Route path="/profile" element={<ProfileForm/>}/>
                            </Route>

                            {/* UNIT_COMMANDER Routes */}
                            <Route element={<ProtectedRoute allowedRoles={[ROLES.UNIT_COMMANDER]}/>}>
                                <Route path="/vehicles" element={<Vehicles/>}/>
                                <Route path="/vehicles/create-vehicle">
                                    <Route index element={<VehicleForm/>}/>
                                    <Route path="vehicle-components/create-component"
                                           element={<VehicleComponentForm/>}/>
                                    <Route path="vehicle-components/edit-component/:vehicleComponentId"
                                           element={<VehicleComponentForm/>}/>
                                </Route>
                                <Route path="/vehicles/edit-vehicle/:vehicleId">
                                    <Route index element={<VehicleForm/>}/>
                                    <Route path="vehicle-components/create-component"
                                           element={<VehicleComponentForm/>}/>
                                    <Route path="vehicle-components/edit-component/:vehicleComponentId"
                                           element={<VehicleComponentForm/>}/>
                                </Route>

                                <Route path="/repairs" element={<Repairs/>}/>
                                <Route path="/repairs/create-repair">
                                    <Route index element={<RepairForm/>}/>
                                    <Route path="repair-components/create-repair" element={<RepairComponentForm/>}/>
                                    <Route path="repair-components/edit-repair/:repairComponentId"
                                           element={<RepairComponentForm/>}/>
                                </Route>
                                <Route path="/repairs/edit-repair/:repairId">
                                    <Route index element={<RepairForm/>}/>
                                    <Route path="repair-components/create-repair" element={<RepairComponentForm/>}/>
                                    <Route path="repair-components/edit-repair/:repairComponentId"
                                           element={<RepairComponentForm/>}/>
                                </Route>

                                <Route path="/maintenances" element={<Maintenances/>}/>
                                <Route path="/maintenances/create-maintenance" element={<MaintenanceForm/>}/>
                                <Route path="/maintenances/edit-maintenance/:maintenanceId"
                                       element={<MaintenanceForm/>}/>
                                <Route path="/mileage-logs" element={<MileageLogs/>}/>

                                {!authStore.userRole || authStore.userRole !== ROLES.COMMANDER ? (
                                    <>
                                        <Route path="/" element={<Dashboard/>}/>
                                        <Route path="/calendar" element={<Calendar/>}/>
                                        <Route path="/profile" element={<ProfileForm/>}/>
                                    </>
                                ) : null}
                            </Route>

                            <Route
                                path="/login"
                                element={!authStore.isAuthenticated ? <LoginPage/> : <Navigate to="/" replace/>}
                            />

                            <Route path="*" element={authStore.isAuthenticated ?
                                <Typography sx={{p: 3}}>Сторінку не знайдено (404)</Typography>
                                : <Navigate to="/login" replace/>}/>
                        </Routes>
                    </main>
                </div>
            </ThemeProvider>
        </ColorModeContext.Provider>
    );
});

export default App;