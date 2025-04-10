const express = require('express');
const router = express.Router();
const MaintenanceController = require('../controllers/maintenanceController');

router.get('/', MaintenanceController.getAll);
router.get('/:id', MaintenanceController.getById);
router.post('/', MaintenanceController.create);
router.put('/:id', MaintenanceController.update);
router.delete('/:id', MaintenanceController.delete);

module.exports = router;