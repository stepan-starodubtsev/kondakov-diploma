import {ColorModeContext, useMode} from "./theme.js";
import {CssBaseline, ThemeProvider} from "@mui/material";
import {Route, Routes} from "react-router-dom";

import TopBar from "./scenes/global/TopBar";
import CustomSideBar from "./scenes/global/CustomSidebar.jsx";
import Dashboard from "./scenes/dashboard";
import Users from "./scenes/users";
import UserForm from "./scenes/users/UserForm.jsx";
import Calendar from "./scenes/calendar";
import FAQ from "./scenes/faq/index.jsx";
import Units from "./scenes/units/index.jsx";
import UnitForm from "./scenes/units/UnitForm.jsx";
import Vehicles from "./scenes/vehicles/index.jsx";
import VehicleForm from "./scenes/vehicles/VehicleForm.jsx";
import VehicleComponentForm from "./scenes/vehicles/VehicleComponentForm.jsx";
import Repairs from "./scenes/repairs/index.jsx";
import RepairComponentForm from "./scenes/repairs/RepairComponentForm.jsx";
import RepairForm from "./scenes/repairs/RepairForm.jsx";


function App() {
    const [theme, colorMode] = useMode();

    return (
        <ColorModeContext.Provider value={colorMode}>
            <ThemeProvider theme={theme}>
                <CssBaseline/>
                <div className="app">
                    <CustomSideBar/>
                    <main className="content">
                        <TopBar/>
                        <Routes>
                            <Route path="/" element={<Dashboard/>}/>
                            <Route path="/units">
                                <Route index element={<Units/>}/>
                                <Route path="create-unit" element={<UnitForm/>}/>
                                <Route path="edit-unit/:unitId" element={<UnitForm/>}/>
                            </Route>
                            <Route path="/users">
                                <Route index element={<Users/>}/>
                                <Route path="create-user" element={<UserForm/>}/>
                                <Route path="edit-user/:userId" element={<UserForm/>}/>
                            </Route>
                            <Route path="/vehicles">
                                <Route index element={<Vehicles/>}/>
                                <Route path="create-vehicle">
                                    <Route index element={<VehicleForm/>}/>
                                    <Route path="vehicle-components/create-component"
                                           element={<VehicleComponentForm/>}/>
                                    <Route path="vehicle-components/edit-component/:vehicleComponentId"
                                           element={<VehicleComponentForm/>}/>
                                </Route>
                                <Route path="edit-vehicle/:vehicleId">
                                    <Route index element={<VehicleForm/>}/>
                                    <Route path="vehicle-components/create-component"
                                           element={<VehicleComponentForm/>}/>
                                    <Route path="vehicle-components/edit-component/:vehicleComponentId"
                                           element={<VehicleComponentForm/>}/>
                                </Route>
                            </Route>
                            <Route path="/repairs">
                                <Route index element={<Repairs/>}/>
                                <Route path="create-repair">
                                    <Route index element={<RepairForm/>}/>
                                    <Route path="repair-components/create-repair"
                                           element={<RepairComponentForm/>}/>
                                    <Route path="repair-components/edit-repair/:repairComponentId"
                                           element={<RepairComponentForm/>}/>
                                </Route>
                                <Route path="edit-repair/:repairId">
                                    <Route index element={<RepairForm/>}/>
                                    <Route path="repair-components/create-repair"
                                           element={<RepairComponentForm/>}/>
                                    <Route path="repair-components/edit-repair/:repairComponentId"
                                           element={<RepairComponentForm/>}/>
                                </Route>
                            </Route>

                            {/*<Route path="/maintenances" element={<Invoices/>}/>*/}
                            {/*<Route path="/mileage-logs" element={<Invoices/>}/>*/}
                            <Route path="/calendar" element={<Calendar/>}/>
                            {/*<Route path="/profile" element={<Calendar/>}/>*/}
                            <Route path="/faq" element={<FAQ/>}/>
                            {/*<Route path="/bar" element={<Bar/>}/>*/}
                            {/*<Route path="/line" element={<Line/>}/>*/}
                            {/*<Route path="/pie" element={<Pie/>}/>*/}
                            {/*<Route path="/geography" element={<Geography/>}/>*/}
                        </Routes>
                    </main>
                </div>
            </ThemeProvider>
        </ColorModeContext.Provider>
    )
}

export default App
