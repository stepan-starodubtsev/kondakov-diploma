const User = require('../models/User');
const {userToDto} = require("../dtos/user.dto");

module.exports = {
    async getAll(req, res) {
        const users = await User.findAll();
        res.json(users.map(user => userToDto(user)));
    },

    async getById(req, res) {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).json({error: 'User not found'});
        res.json(userToDto(user));
    },

    async create(req, res) {
        const newUser = await User.create(req.body);
        res.status(201).json(userToDto(newUser));
    },

    async update(req, res) {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).json({error: 'User not found'});
        await user.update(req.body);
        res.json(userToDto(user));
    },

    async delete(req, res) {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).json({error: 'User not found'});
        await user.destroy();
        res.status(204).send();
    }
};
