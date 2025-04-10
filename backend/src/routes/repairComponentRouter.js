const express = require('express');
const router = express.Router();
const RepairComponentController = require('../controllers/repairComponentController');

router.get('/', RepairComponentController.getAll);
router.get('/:id', RepairComponentController.getById);
router.post('/', RepairComponentController.create);
router.put('/:id', RepairComponentController.update);
router.delete('/:id', RepairComponentController.delete);

module.exports = router;