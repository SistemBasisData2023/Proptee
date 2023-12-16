const ptService = require('../services/services');


async function userLogin(req,res){
    try{
        const result = await ptService.userLogin(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function userRegister(req,res){
    try{
        const result = await ptService.userRegister(req.body);
        res.json(result);
    }catch(err){
        res.json(err.detail);
    }
}

async function getUser(req,res){
    try{
        const result = await ptService.getUser(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function deleteUser(req,res){
    try{
        const result = await ptService.deleteUser(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function agentLogin(req,res){
    try{
        const result = await ptService.agentLogin(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function agentRegister(req,res){
    try{
        const result = await ptService.agentRegister(req.body);
        res.json(result);
    }catch(err){
        res.json(err.detail);
    }
}

async function getAgent(req,res){
    try{
        const result = await ptService.getAgent(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function deleteAgent(req,res){
    try{
        const result = await ptService.deleteAgent(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function addProperties(req,res){
    try{
        const result = await ptService.addProperties(req.body,req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function showProperties(req,res){
    try{
        const result = await ptService.showProperties(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function addTransactions(req,res){
    try{
        const result = await ptService.addTransactions(req.body,req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function showTransactions(req,res){
    try{
        const result = await ptService.showTransactions(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function updateProperties(req,res){
    try{
        const result = await ptService.updateProperties(req.body,req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function updateTransactions(req,res){
    try{
        const result = await ptService.updateTransactions(req.body,req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function searchProperties(req,res){
    try{
        const result = await ptService.searchProperties(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

async function searchTransactions(req,res){
    try{
        const result = await ptService.searchTransactions(req.body);
        res.json(result);
    }catch(err){
        res.json(err);
    }
}

module.exports = {
    userLogin,
    userRegister,
    getUser,
    deleteUser,
    agentLogin,
    agentRegister,
    getAgent,
    deleteAgent,
    addProperties,
    showProperties,
    addTransactions,
    showTransactions,
    updateProperties,
    updateTransactions,
    searchProperties,
    searchTransactions
}