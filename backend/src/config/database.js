import {Sequelize} from 'sequelize';

const sequelize = new Sequelize('ballots-backend', 'postgres', '567123', {
    host: 'localhost',
    dialect: 'postgres',
});

export default sequelize;