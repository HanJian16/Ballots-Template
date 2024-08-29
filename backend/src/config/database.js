// import { Sequelize } from "sequelize";
// import dotenv from "dotenv";

// dotenv.config();
// const { PGHOST, PGDATABASE, PGUSER, PGPASSWORD } = process.env;

// const sequelize = new Sequelize(PGDATABASE, PGUSER, PGPASSWORD, {
//   host: PGHOST,
//   dialect: "postgres",
//   dialectOptions: {
//     ssl: {
//       require: true,
//       rejectUnauthorized: false, // Necesario para conexiones con SSL
//     },
//   },
// });

// export default sequelize;

import {Sequelize} from 'sequelize';
import dotenv from "dotenv";

dotenv.config();

const sequelize = new Sequelize(process.env.DATABASE_NAME, process.env.USER_DB_NAME, process.env.USER_DB_PASSWORD, {
    host: process.env.DATABASE_HOST,
    dialect: process.env.DATABASE_DIALECT,
});

export default sequelize;

