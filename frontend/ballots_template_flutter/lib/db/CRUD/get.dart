import 'package:ballots_template_flutter/db/main.dart';
import 'package:ballots_template_flutter/models/index.dart';

Future<Store?> getStore() async {
  final db = await DatabaseHelper().database;
  final listData = await db.query('store');

  if (listData.isEmpty) return null;

  final data = listData[0];
  return Store.fromMap(data);
}

Future<List<HistoryProduct>> getHistoryProducts() async {
  final db = await DatabaseHelper().database;
  final listData =
      await db.query('historyProduct', where: 'isDeleted = ?', whereArgs: [0]);

  final historyProducts =
      listData.map((e) => HistoryProduct.fromMap(e)).toList();
  return historyProducts;
}

Future<List<HistoryService>> getHistoryServices() async {
  final db = await DatabaseHelper().database;
  final listData =
      await db.query('historyService', where: 'isDeleted = ?', whereArgs: [0]);

  final historyServices =
      listData.map((e) => HistoryService.fromMap(e)).toList();
  return historyServices;
}

Future<List<Product>> getProducts() async {
  final db = await DatabaseHelper().database;
  final listData = await db.query(
    'product',
    where: 'isDeleted = ?',
    whereArgs: [0],
  );

  final products = listData.map((e) => Product.fromMap(e)).toList();
  return products;
}

Future<List<Service>> getServices() async {
  final db = await DatabaseHelper().database;
  final listData =
      await db.query('service', where: 'isDeleted = ?', whereArgs: [0]);

  final services = listData.map((e) => Service.fromMap(e)).toList();
  return services;
}

Future<List<Client>> getClients() async {
  final db = await DatabaseHelper().database;
  final listData =
      await db.query('client', where: 'isDeleted = ?', whereArgs: [0]);

  final clients = listData.map((e) => Client.fromMap(e)).toList();
  return clients;
}

Future<Client?> getClientById(int id) async {
  final db = await DatabaseHelper().database;
  final result = await db.query(
    'client',
    where: 'id = ?',
    whereArgs: [id],
  );

  // Si el resultado no está vacío, lo convierte en una instancia de Product.
  return result.isNotEmpty ? Client.fromMap(result.first) : null;
}

Future<Product?> getProductById(int id) async {
  final db = await DatabaseHelper().database;
  final result = await db.query(
    'product',
    where: 'id = ?',
    whereArgs: [id],
  );

  // Si el resultado no está vacío, lo convierte en una instancia de Product.
  return result.isNotEmpty ? Product.fromMap(result.first) : null;
}

Future<Service?> getServiceById(int id) async {
  final db = await DatabaseHelper().database;
  final result = await db.query(
    'service',
    where: 'id = ?',
    whereArgs: [id],
  );

  // Si el resultado no está vacío, lo convierte en una instancia de Service.
  return result.isNotEmpty ? Service.fromMap(result.first) : null;
}

Future<HistoryProduct?> getHistoryProductById(int id) async {
  final db = await DatabaseHelper().database;
  final result = await db.query(
    'historyProduct',
    where: 'id = ?',
    whereArgs: [id],
  );

  // Si el resultado no está vacío, lo convierte en una instancia de HistoryProduct.
  return result.isNotEmpty ? HistoryProduct.fromMap(result.first) : null;
}

Future<HistoryService?> getHistoryServiceById(int id) async {
  final db = await DatabaseHelper().database;
  final result = await db.query(
    'historyService',
    where: 'id = ?',
    whereArgs: [id],
  );

  // Si el resultado no está vacío, lo convierte en una instancia de HistoryService.
  return result.isNotEmpty ? HistoryService.fromMap(result.first) : null;
}
