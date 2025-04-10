function logEntryToDto(entry) {
    return {
        id: entry.id,
        userId: entry.userId,
        action: entry.action,
        entityType: entry.entityType,
        entityId: entry.entityId,
        timestamp: entry.timestamp
    };
}

module.exports = { logEntryToDto };