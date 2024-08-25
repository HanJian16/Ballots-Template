import Store from "../models/Store.js";

export const createStore = async (req, res) => {
  try {
    const storeData = req.body;
    console.log("Datos de recibidos:", storeData);
    const newStore = Store.create(storeData);
    res.status(201).json({
      message: "Tienda creada exitosamente",
      data: newStore,
    });
  } catch (error) {
    res.status(500).json({
      message: "Error al crear la tienda",
      error: error,
    });
  }
};
