const User = require('../models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
require('dotenv').config();

exports.register = async (req, res) => {
    const {username, password, role} = req.body;

    try {
        let user = await User.findOne({where: {username}});
        if (user) {
            return res.status(400).json({message: 'User already exists'});
        }

        user = await User.create({username, password: bcrypt.hashSync(password, 10), role});

        const payload = {user: {id: user.id, username: user.username, role: user.role}};

        jwt.sign(payload, process.env.JWT_SECRET, {expiresIn: process.env.JWT_EXPIRATION}, (err, token) => {
            if (err) throw err;
            console.log(`Created token: ${token}`);
            res.json({token});
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.login = async (req, res) => {
    const {username, password} = req.body;

    try {
        const user = await User.findOne({where: {username}});

        if (!user) {
            return res.status(400).json({message: 'Invalid Credentials'});
        }

        const isMatch = await bcrypt.compare(password, user.password);

        if (!isMatch) {
            return res.status(400).json({message: 'Invalid Credentials'});
        }

        const payload = {user: {id: user.id, username: user.username, role: user.role}};

        jwt.sign(payload, process.env.JWT_SECRET, {expiresIn: process.env.JWT_EXPIRATION}, (err, token) => {
            if (err) throw err;
            console.log(`Created token: ${token}`);
            res.json({token});
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};
