const express = require('express');
const router = express.Router();
const MileageLogController = require('../controllers/mileageLogController');


router.get('/', MileageLogController.getAll);
router.get('/:id', MileageLogController.getById);
router.post('/', MileageLogController.create);
router.put('/:id', MileageLogController.update);
router.delete('/:id', MileageLogController.delete);

module.exports = router;