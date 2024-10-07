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
        jobRole: req.body.jobRole

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

// view users
const viewUser = async (req, res) => {
    try{
        let users = await User.findAll({
            attributes: ['userId','userName', 'email', 'jobRole']
        });
        res.status(200).send(users);
    }
    catch(error){
        res.send("Error occured: " + error);
        
    }
}


// delete user

const deleteUser = async (req, res) => {
    let id = req.params.id;

    try{
        let user = await User.findOne({ where: { userId: id}});
        if(!user){
            return res.status(404).send("Error: User not found");
        }

        await User.destroy({ where: {userId: id}});
        return res.status(200).send(`User deleted userId = ${id}`);
    }
    catch(error){
        return res.send("error occred: " + error);
    }
}


// update user
const updateUser = async (req,res) => {

    let id = req.params.id;
    
    let user = await User.findOne({ where: { userId: id }});
    if(!user){
        return res.status(404).send("User not found");
    }

    try {
        const updatedUser = await User.update(req.body, { where: {userId: id}});
        return res.status(200).send("Updated User: " + updateUser);
    } catch (error) {
        return res.send("Error occured: " + error);
    }
}

module.exports = {
    addUser,
    viewUser,
    deleteUser,
    updateUser
}