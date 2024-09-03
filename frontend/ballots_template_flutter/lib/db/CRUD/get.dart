import 'package:ballots_template_flutter/db/main.dart';
import 'package:ballots_template_flutter/models/index.dart';

Future<Store?> getStore() async {
  final db = await DatabaseHelper().database;
  final listData = await db.query('store');

  if (listData.isEmpty) return null;

  final data = listData[0];
  return Store.fromMap(data);
}

Future<List<Map<String, dynamic>>> getHistory() async {
  final db = await DatabaseHelper().database;
  return await db.query('history');
}

Future<List<Product>> getProducts() async {
  final db = await DatabaseHelper().database;
  final listData = await db.query('product');

  final products = listData.map((e) => Product.fromMap(e)).toList();
  return products;
}

Future<List<Service>> getServices() async {
  final db = await DatabaseHelper().database;
  final listData = await db.query('service');

  final services = listData.map((e) => Service.fromMap(e)).toList();
  return services;
}

Future<List<Client>> getClients() async {
  final db = await DatabaseHelper().database;
  final listData = await db.query('client');

  final clients = listData.map((e) => Client.fromMap(e)).toList();
  return clients;
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