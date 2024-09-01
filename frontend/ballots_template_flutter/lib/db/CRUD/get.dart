import 'package:ballots_template_flutter/db/main.dart';

Future<List<Map<String, dynamic>>> getStore() async {
  final db = await DatabaseHelper().database;
  return await db.query('store');
}

Future<List<Map<String, dynamic>>> getHistory() async {
  final db = await DatabaseHelper().database;
  return await db.query('history');
}

Future<List<Map<String, dynamic>>> getProducts() async {
  final db = await DatabaseHelper().database;
  return await db.query('product');
}

Future<List<Map<String, dynamic>>> getServices() async {
  final db = await DatabaseHelper().database;
  return await db.query('service');
}

Future<List<Map<String, dynamic>>> getClients() async {
  final db = await DatabaseHelper().database;
  return await db.query('client');
}
