import express from "express";
import usersRoutes from "./routes/store.routes.js";
import sequelize from "./config/database.js";
import dotenv from "dotenv";

dotenv.config();
const PORT = process.env.PORT || 3000;

const app = express();

app.use(express.json());

app.use(usersRoutes);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running on port ${PORT}`);

  sequelize
    .authenticate()
    .then(() => {
      console.log("Conectado a la base de datos.");
      return sequelize.sync({ force: true });
    })
    .catch((err) => {
      console.error("Error al conectar con la base de datos:", err);
    });
});
