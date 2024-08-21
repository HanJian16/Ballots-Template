import sequelize from '../config/database.js';
import User from './User.js';
import History from './History.js';
import Clients from './Clients.js';

User.hasMany(History, {foreignKey: 'user_id', onDelete: 'CASCADE'});
History.belongsTo(User, {foreignKey: 'user_id'});

User.hasMany(Clients, {foreignKey: 'user_id', onDelete: 'CASCADE'});
Clients.belongsTo(User, {foreignKey: 'user_id'});

sequelize.sync({force: false}).then(() => {
  console.log('Tablas sinconizadas');
});

export {User, History, Clients};