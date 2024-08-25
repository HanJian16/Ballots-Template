import { DataTypes } from "sequelize";
import sequelize from "../config/database.js";

const Store = sequelize.define("Store", {
  nameStore: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  phoneStore: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  addressStore: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  emailStore: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  rucStore: {
    type: DataTypes.STRING,
    validate: {
        len: [8, 11],
    },
    allowNull: false,
  },
  signerName:{
      type: DataTypes.STRING,
      allowNull: false,
  },
  signerRole: {
    type: DataTypes.STRING,
    allowNull: false,
  },
//   logo: {
//     type: DataTypes.BLOB("long"),
//     allowNull: false,
//   },
  createdAt: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
});

export default Store;
