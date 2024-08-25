import sequelize from '../config/database.js';
import Store from './Store.js';
import History from './History.js';
import Clients from './Clients.js';

Store.hasMany(History, {foreignKey: 'store_id', onDelete: 'CASCADE'});
History.belongsTo(Store, {foreignKey: 'store_id'});

Store.hasMany(Clients, {foreignKey: 'store_id', onDelete: 'CASCADE'});
Clients.belongsTo(Store, {foreignKey: 'store_id'});

sequelize.sync({force: false}).then(() => {
  console.log('Tablas sincronizadas');
});

export {Store, History, Clients};