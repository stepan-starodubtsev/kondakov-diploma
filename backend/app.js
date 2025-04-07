const express = require('express');
const app = express();
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const fs = require('fs');
const path = require('path');
const authRouter = require('./routes/authRouter');
app.use(express.json());

app.use(cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

const swaggerDocument = JSON.parse(fs.readFileSync(path.resolve(__dirname, 'swagger.json'), 'utf8'));
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use('/api/auth', authRouter);

app.get('/', (req, res) => res.send('API is running...'));

module.exports = app;
