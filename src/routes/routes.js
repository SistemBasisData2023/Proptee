const passport = require('passport');
const express = require('express');
const router = express.Router();
const ptController = require('../controllers/controllers');

router.post('/userlogin', ptController.userLogin);

router.post('/userregister', ptController.userRegister);

router.get('/getuser', ptController.getUser);

router.delete('/deleteuser', ptController.deleteUser);

router.post('/agentlogin', ptController.agentLogin);

router.post('/agentregister', ptController.agentRegister);

router.get('/getagent', ptController.getAgent);

router.delete('/deleteagent', ptController.deleteAgent);

router.post('/addproperties', ptController.addProperties);

router.get('/showproperties', ptController.showProperties);

router.post('/addtransactions', ptController.addTransactions);

router.get('/showtransactions', ptController.showTransactions);

module.exports = router;