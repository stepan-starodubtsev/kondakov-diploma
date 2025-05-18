const express = require('express');
const app = express();
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const fs = require('fs');
const path = require('path');

// Middleware
const authMiddleware = require('./middleware/authMiddleware');
const roleMiddleware = require('./middleware/roleMiddleware');
const {ROLES} = require('./config/constants');

// Routers
const authRouter = require('./routes/authRouter');
const maintenanceRouter = require('./routes/maintenanceRouter');
const repairComponentRouter = require('./routes/repairComponentRouter');
const repairRouter = require('./routes/repairRouter');
const userRouter = require('./routes/userRouter');
const unitRouter = require('./routes/unitRouter');
const vehicleRouter = require('./routes/vehicleRouter');
const mileageLogRouter = require('./routes/mileageLogRouter');
const vehicleComponentRouter = require('./routes/vehicleComponentRouter');

app.use(express.json());

app.use(cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

const swaggerDocument = JSON.parse(fs.readFileSync(path.resolve(__dirname, 'swagger.json'), 'utf8'));
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// --- Public Routes ---
app.use('/api/auth', authRouter);

// --- Protected Routes ---
app.use(authMiddleware);

// --- Role-Based Access ---

// 1. ADMIN Routes
const adminPermissions = {
    [ROLES.ADMIN]: {methods: '*'}
};
const denyNonAdmin = (req, res, next) => {
    if (req.user.user.role !== ROLES.ADMIN) {
        return res.status(403).json({message: `Access Denied: Only ADMIN can access ${req.baseUrl}.`});
    }
    next();
}

app.use('/api/users', denyNonAdmin, roleMiddleware(adminPermissions), userRouter);
app.use('/api/units', denyNonAdmin, roleMiddleware(adminPermissions), unitRouter);


// 2. DUTY_STAFF Routes
const dutyStaffPermissions = {
    [ROLES.DUTY_STAFF]: {methods: '*'}
};
const denyNonDutyStaffForMileage = (req, res, next) => {
    if (req.user.user.role !== ROLES.DUTY_STAFF) {
        return res.status(403).json({message: `Access Denied: Only DUTY_STAFF can access ${req.baseUrl}.`});
    }
    next();
}
app.use('/api/mileage-logs', denyNonDutyStaffForMileage, roleMiddleware(dutyStaffPermissions), mileageLogRouter);


// 3. COMMANDER Routes
const commanderPermissions = {
    [ROLES.COMMANDER]: {
        methods: ['GET'],
        forbiddenRoutes: ['/api/users', '/api/units']
    }
};
const commanderRouteCheck = (req, res, next) => {
    if (req.user.user.role === ROLES.COMMANDER) {
        if (req.baseUrl === '/api/users' || req.baseUrl === '/api/units') {
            return res.status(403).json({message: `Access Denied: COMMANDER cannot access ${req.baseUrl}.`});
        }
        if (req.method !== 'GET') {
            return res.status(403).json({message: `Access Denied: COMMANDER can only perform GET requests on ${req.baseUrl}.`});
        }
    }
    next();
};


// 4. UNIT_COMMANDER Routes
const unitCommanderPermissions = {
    [ROLES.UNIT_COMMANDER]: {
        methods: '*',
        forbiddenRoutes: ['/api/users', '/api/units']
    }
};
const unitCommanderRouteCheck = (req, res, next) => {
    if (req.user.user.role === ROLES.UNIT_COMMANDER) {
        if (req.baseUrl === '/api/users' || req.baseUrl === '/api/units') {
            return res.status(403).json({message: `Access Denied: UNIT_COMMANDER cannot access ${req.baseUrl}.`});
        }
    }
    next();
};



const generalPermissions = {
    [ROLES.COMMANDER]: commanderPermissions[ROLES.COMMANDER],
    [ROLES.UNIT_COMMANDER]: unitCommanderPermissions[ROLES.UNIT_COMMANDER],
};

app.use([
    '/api/maintenance',
    '/api/repair-components',
    '/api/repairs',
    '/api/vehicles',
    '/api/vehicle-components'
], roleMiddleware(generalPermissions));

app.use('/api/maintenance', maintenanceRouter);
app.use('/api/repair-components', repairComponentRouter);
app.use('/api/repairs', repairRouter);
app.use('/api/vehicles', vehicleRouter);
app.use('/api/vehicle-components', vehicleComponentRouter);


app.get('/api', (req, res) => res.send('API is running... (Authenticated)'));

app.use((error, req, res, next) => {
    console.error("Error Handler:", error);
    const statusCode = error.statusCode || 500;
    const message = error.message || "Internal Server Error";
    res.status(statusCode).json({
        status: statusCode,
        message: message,
        ...(process.env.NODE_ENV === 'development' && {stack: error.stack}) // Додаємо стек в режимі розробки
    });
});

module.exports = app;