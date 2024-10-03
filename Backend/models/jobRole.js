module.exports = (sequelize, DataTypes) => {
    const JobRole = sequelize.define("jobrole", {
        jobRoleId: {
            type: DataTypes.INTEGER,
            primaryKey: true,        // Primary key
            autoIncrement: true,     // Auto-incrementing ID
            allowNull: false
          },
          roleName: {
            type: DataTypes.STRING,
            allowNull: false,        // Role name cannot be null
            unique: true             // Ensure uniqueness of job roles
          }
    });

    return JobRole;
}