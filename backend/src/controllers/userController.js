const {userToDto} = require("../dtos/user.dto");
const {
    getAllUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser
} = require("../services/UserService");

module.exports = {
    async getAll(req, res) {
        const userDTOs = getAllUsers();
        res.json(userDTOs);
    },

    async getById(req, res) {
        const userDTO = getUserById(req.params.id);
        res.json(userToDto(userDTO));
    },

    async create(req, res) {
        const newUser = createUser(req.body);
        res.status(201).json(newUser);
    },

    async update(req, res) {
        const userDTO = updateUser(req.params.id, req.body);
        res.json(userToDto(userDTO));
    },

    async delete(req, res) {
        await deleteUser(req.params.id);
        res.status(204).send();
    }
};
