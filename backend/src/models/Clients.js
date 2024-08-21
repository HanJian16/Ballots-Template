import { DataTypes } from 'sequelize';
import sequelize from '../db';

const Clients = sequelize.define('Clients', {
  clientName: {
      type: DataTypes.STRING,
      allowNull: false,
  },
});

export default Clients;