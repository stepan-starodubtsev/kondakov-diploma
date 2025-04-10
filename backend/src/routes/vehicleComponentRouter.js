const express = require('express');
const router = express.Router();
const VehicleComponentController = require('../controllers/vehicleComponentController');

router.get('/', VehicleComponentController.getAll);
router.get('/:id', VehicleComponentController.getById);
router.post('/', VehicleComponentController.create);
router.put('/:id', VehicleComponentController.update);
router.delete('/:id', VehicleComponentController.delete);

module.exports = router;