import { DataTypes } from 'sequelize';
import sequelize from '../db';

const History = sequelize.define('History', {
    action: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    actionDate: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW,
    },
});

export default History;