import express from 'express';
import { PORT } from './config.js';
import usersRoutes from './routes/users.routes.js';
import sequelize from './config/database.js';

const app = express();

app.use(express.json());

app.use(usersRoutes);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);

    sequelize.authenticate().then(() => {
        console.log('Conectado a la base de datos.');
    }).catch((err) => {
        console.error('Error al conectar con la base de datos:', err);
    });
});