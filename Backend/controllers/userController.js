const { where } = require('sequelize');
const db = require('../models');


// call model
const User = db.users;

//----crud operations

//-- 1.create


const addUser = async (req, res) => {
    let userInfo = {
        
        userName: req.body.userName,
        email: req.body.email,
        passWordHash: req.body.passWordHash,
        jobRoleId: req.body.jobRoleId

    }

        

    console.log(userInfo);
    try {
        const user = await User.create(userInfo);
        res.status(201).send(user);  // Send the created admin back as a response
        console.log(user);
    } catch (error) {
        console.error("Error creating admin:", error);
        res.status(500).send("Internal Server Error");
    }
}


const viewUser = async (req, res) => {
    try{
        let users = await User.findAll({});
        res.status(200).send(users);
    }
    catch(error){
        res.send("Error occured: " + error);
        
    }
}


module.exports = {
    addUser,
    viewUser
}