// import controller
const userController = require('../controllers/userController');

//router
const router = require('express').Router();

// add routes
router.post('/addUser', userController.addUser);
router.get('/getUsers', userController.viewUser);
router.delete('/deleteUser/:id', userController.deleteUser);
router.patch('/updateUser/:id', userController.updateUser);

module.exports = router;