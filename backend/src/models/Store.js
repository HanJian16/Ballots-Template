import { DataTypes } from "sequelize";
import sequelize from "../db";

const User = sequelize.define("Store", {
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
  },
  rucStore: {
    type: DataTypes.STRING,
  },
  signerName:{
      type: DataTypes.STRING,
      allowNull: false,
  },
  signerRole: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  logo: {
    type: DataTypes.BLOB("long"),
  },
  createdAt: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
});

export default User;
