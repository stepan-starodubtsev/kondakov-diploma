const express = require('express');
const app = express();
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const fs = require('fs');
const path = require('path');
const authRouter = require('./routes/authRouter');
const logEntryRouter = require('./routes/logEntryRouter');
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
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));


const swaggerDocument = JSON.parse(fs.readFileSync(path.resolve(__dirname, 'swagger.json'), 'utf8'));
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use('/api/auth', authRouter);
app.use('/api/logs', logEntryRouter);
app.use('/api/maintenance', maintenanceRouter);
app.use('/api/repair-components', repairComponentRouter);
app.use('/api/repairs', repairRouter);
app.use('/api/users', userRouter);
app.use('/api/units', unitRouter);
app.use('/api/vehicles', vehicleRouter);
app.use('/api/mileage-logs', mileageLogRouter);
app.use('/api/vehicle-components', vehicleComponentRouter);

app.get('/api', (req, res) => res.send('API is running...'));

app.use((err, req, res, next) => {
    const status = err.statusCode || 500;
    res.status(status).json({
        error: err.message || 'Internal Server Error'
    });
});

module.exports = app;
