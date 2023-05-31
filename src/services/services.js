const res = require('express/lib/response');
const { use } = require('passport/lib');
const db = require('../configs/database');
const helper = require('../utils/helper');

async function userLogin (pt){
    const {username, password} = pt;
    const query = `SELECT * FROM users WHERE username = '${username}'`;
    const result = await db.query(query);
    if(result.rowCount > 0){
        const user = result.rows[0];
        if(user.password === password){
            return {
                message: 'Login successful',
                user
            }
        }else{
            return {
                message: 'Password is not correct'
            }
        }
    }
}

async function userRegister (pt){
    const {username, password, email} = pt;
    const query = `INSERT INTO users (username, password, email) VALUES ('${username}', '${password}', '${email}')`;
    const result = await db.query(query);
    if(result.rowCount === 1){
        return {
            message: 'User Created'
        }
    }else{
        return{
            message: 'Error'
        } 
    }
}

async function getUser (user){
    if(user){
        const query = `SELECT * FROM users WHERE "user_id" = '${user.user_id}'`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'User found',
                user : result.rows
            }
        }else{
            return {
                message: 'User not found'
            }
        }
    }else{
        return {
            message: 'User not found'
        }
    }
}

async function deleteUser (user){
    if(user){
        const query = `DELETE FROM users WHERE "user_id" = ${user.user_id}`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'User deleted'
            }
        }
        else{
            return {
                message: 'User not found'
            }
        }
    }
    else{
        return {
            message: 'USer not logged in'
        }
    }
}

async function agentLogin (pt){
    const {username, password} = pt;
    const query = `SELECT * FROM agent WHERE username = '${username}'`;
    const result = await db.query(query);
    if(result.rowCount > 0){
        const user = result.rows[0];
        if(user.password === password){
            return {
                message: 'Login successful',
                user
            }
        }else{
            return {
                message: 'Password is not correct'
            }
        }
    }
}

async function agentRegister (pt){
    const {username, password, email} = pt;
    const query = `INSERT INTO agent (username, password, email) VALUES ('${username}', '${password}', '${email}')`;
    const result = await db.query(query);
    if(result.rowCount === 1){
        return {
            message: 'Agent Created'
        }
    }else{
        return{
            message: 'Error'
        } 
    }
}

async function getAgent (agent){
    if(agent){
        const query = `SELECT * FROM agent WHERE "agent_id" = '${agent.agent_id}'`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'Agent found',
                user : result.rows
            }
        }else{
            return {
                message: 'Agent not found'
            }
        }
    }else{
        return {
            message: 'Agent not found'
        }
    }
}

async function deleteAgent (agent){
    if(agent){
        const query = `DELETE FROM users WHERE "agent_id" = ${agent.agent_id}`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'User deleted'
            }
        }
        else{
            return {
                message: 'User not found'
            }
        }
    }
    else{
        return {
            message: 'USer not logged in'
        }
    }
}

async function addProperties (pt, user){
    const {Nama, Description, alamat, luas, Harga, jumlah_kamar, jumlah_kamar_mandi, Status} = pt;
    if(user){
        const query = `INSERT INTO properties (Nama, Description, alamat, luas, Harga, jumlah_kamar, jumlah_kamar_mandi, agent_id, Status) 
        VALUES ('${Nama}', '${Description}', '${alamat}', '${luas}', ${Harga}, ${jumlah_kamar}, ${jumlah_kamar_mandi}, '${user.agent_id}','${Status}')`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'Properties Added'
            }
        }else{
            return{
                message: 'Error'
            } 
        }
    }
    else{
        return {
            message: 'User not logged in'
        }
    }
}

async function showProperties (user){
    if(user){
        const query = `SELECT * FROM properties WHERE Nama='${user.Nama}'`;
        const result = await db.query(query);
        if(result.rowCount > 0){
            return {
                message: 'Property Found',
                showIndividualTask : result.rows
            }
        }else{
            return{
                message: 'No property Found' 
            } 
        }
    }
    else{
        return {
            message: 'User not logged in'
        }
    }
}

async function addTransactions (pt, user){
    const {Nama, Harga, Status} = pt;
    if(user){
        const query = `INSERT INTO transactions (user_id, agent_id, property_id, Nama, Harga, Status) 
        VALUES (${user.user_id}, ${user.agent_id}, ${user.property_id},'${Nama}', ${Harga}, '${Status}')`;
        const result = await db.query(query);
        if(result.rowCount === 1){
            return {
                message: 'Transaction Added'
            }
        }else{
            return{
                message: 'Error'
            } 
        }
    }
    else{
        return {
            message: 'User not logged in'
        }
    }
}

async function showTransactions (user){
    if(user){
        const query = `SELECT * FROM transactions WHERE transaction_id=${user.transaction_id}`;
        const result = await db.query(query);
        if(result.rowCount > 0){
            return {
                message: 'Transaction Found',
                showIndividualTask : result.rows
            }
        }else{
            return{
                message: 'No transaction Found' 
            } 
        }
    }
    else{
        return {
            message: 'User not logged in'
        }
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
    showTransactions
}