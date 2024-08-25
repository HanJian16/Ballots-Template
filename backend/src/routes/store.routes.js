import { Router } from "express";
import { createStore } from "../controllers/store.controllers.js";

const router = Router();

router.get("/users", (req, res) => {
  res.send("obteniendo usuarios");
});

router.get("/users/:id", (req, res) => {
  const userId = req.params.id;
  res.send("obteniendo usuario " + userId);
});

router.post("/users", createStore);

router.put("/users/:id", (req, res) => {
  const userId = req.params.id;
  res.send("actualizando usuario " + userId);
});

router.delete("/users/:id", (req, res) => {
  const userId = req.params.id;
  res.send("eliminando usuario " + userId);
});

export default router;
