function userToDto(user) {
    return {
        id: user.id,
        name: user.name,
        username: user.username,
        role: user.role,
        unitId: user.unitId
    };
}

module.exports = { userToDto };