console.log("index.js is running");


const dbConfig = require('../config/dbConfig.js');

const { Sequelize, DataTypes } = require('sequelize');

const sequelize = new Sequelize(
    dbConfig.DB,
    dbConfig.USER,
    dbConfig.PASSWORD, {
        host: dbConfig.HOST,
        dialect: dbConfig.dialect
    }

)

sequelize.authenticate()
.then(() => {
    console.log("Connected...");
})
.catch(err => {console.log("Error occured: " + err);
})

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;


//----model initialize
db.users = require('./user.js')(sequelize, DataTypes);
db.jobRoles = require('./jobRole.js')(sequelize, DataTypes);


db.sequelize.sync({ force: false })
.then(() => {
    console.log("Resync done...");
    
});


//--------table relations




module.exports = db;