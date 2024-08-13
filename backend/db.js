const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('ballots-backend', 'postgres', 'admin', {
    host: 'localhost',
    dialect: 'postgres',
});

module.exports = sequelize;