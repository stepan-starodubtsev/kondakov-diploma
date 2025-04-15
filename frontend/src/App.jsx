import {ColorModeContext, useMode} from "./theme.js";
import {CssBaseline, ThemeProvider} from "@mui/material";
import {Route, Routes} from "react-router-dom";

import TopBar from "./scenes/global/TopBar";
import CustomSideBar from "./scenes/global/CustomSidebar.jsx";
import Dashboard from "./scenes/dashboard";
// import Team from "./scenes/team";
// import Contacts from "./scenes/users/index.jsx";
// import Invoices from "./scenes/invoices";
import Calendar from "./scenes/calendar";
import FAQ from "./scenes/faq/index.jsx";
// import Bar from "./scenes/bar";
// import Line from "./scenes/line";
// import Pie from "./scenes/pie";
// import Geography from "./scenes/geography";


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
                            {/*<Route path="/users" element={<Contacts/>}/>*/}
                            {/*<Route path="/units" element={<Contacts/>}/>*/}
                            {/*<Route path="/cars" element={<Team/>}/>*/}
                            {/*<Route path="/repairs" element={<Invoices/>}/>*/}
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
