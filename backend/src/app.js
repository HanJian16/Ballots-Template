import express from "express";
import { PORT } from "./config.js";
import usersRoutes from "./routes/store.routes.js";
import sequelize from "./config/database.js";

const app = express();

app.use(express.json());

app.use(usersRoutes);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running on port ${PORT}`);

  sequelize
    .authenticate()
    .then(() => {
      console.log("Conectado a la base de datos.");
      return sequelize.sync({ force: false });
    })
    .catch((err) => {
      console.error("Error al conectar con la base de datos:", err);
    });
});
