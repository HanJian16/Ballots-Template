import {Sequelize} from 'sequelize';
import dotenv from "dotenv";

dotenv.config();

const sequelize = new Sequelize(process.env.DATABASE_NAME, process.env.USER_DB_NAME, process.env.USER_DB_PASSWORD, {
    host: process.env.DATABASE_HOST,
    dialect: process.env.DATABASE_DIALECT,
});

export default sequelize;