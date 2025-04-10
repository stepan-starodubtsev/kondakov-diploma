const express = require('express');
const router = express.Router();
const UnitController = require('../controllers/unitController');

router.get('/', UnitController.getAll);
router.get('/:id', UnitController.getById);
router.post('/', UnitController.create);
router.put('/:id', UnitController.update);
router.delete('/:id', UnitController.delete);

module.exports = router;