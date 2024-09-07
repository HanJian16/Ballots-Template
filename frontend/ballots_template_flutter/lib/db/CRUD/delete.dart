import 'package:ballots_template_flutter/db/index.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> deleteDb() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'ballots_template_flutter.db');
  return await deleteDatabase(path);
}

Future<void> deleteClient(int id) async {
  final db = await DatabaseHelper().database;
  await db.delete(
    'client',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> deleteProduct(int id) async {
  final db = await DatabaseHelper().database;
  await db.delete(
    'product',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> deleteService(int id) async {
  final db = await DatabaseHelper().database;
  await db.delete(
    'service',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> deleteHistoryProduct(int id) async {
  final db = await DatabaseHelper().database;
  await db.delete(
    'historyProduct',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> deleteHistoryService(int id) async {
  final db = await DatabaseHelper().database;
  await db.delete(
    'historyService',
    where: 'id = ?',
    whereArgs: [id],
  );
}
