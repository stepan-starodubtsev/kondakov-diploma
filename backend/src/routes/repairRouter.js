const express = require('express');
const router = express.Router();
const RepairController = require('../controllers/repairController');


router.get('/', RepairController.getAll);
router.get('/:id', RepairController.getById);
router.post('/', RepairController.create);
router.put('/:id', RepairController.update);
router.delete('/:id', RepairController.delete);

module.exports = router;