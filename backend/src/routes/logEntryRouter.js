const express = require('express');
const router = express.Router();
const LogEntryController = require('../controllers/logEntryController');

router.get('/', LogEntryController.getAll);
router.get('/:id', LogEntryController.getById);
router.post('/', LogEntryController.create);
router.delete('/:id', LogEntryController.delete);

module.exports = router;
