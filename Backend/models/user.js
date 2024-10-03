module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('user', {
        userId: {
            type: DataTypes.INTEGER,
            primaryKey: true,        // Define as primary key
            autoIncrement: true,     // Auto-increment for the primary key
            allowNull: false
          },
          userName: {
            type: DataTypes.STRING,
            allowNull: false,
          },
          email: {
            type: DataTypes.STRING,
            allowNull: false,
            
          },
        
          passWordHash: {
            type: DataTypes.STRING,
            allowNull: false
          },
          jobRole:{
            type: DataTypes.STRING
          }
    });

    return User;
}