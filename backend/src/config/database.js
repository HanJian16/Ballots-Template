import {Sequelize} from 'sequelize';

const sequelize = new Sequelize('ballots-backend', 'postgres', 'admin', {
    host: 'localhost',
    dialect: 'postgres',
});

export default sequelize;