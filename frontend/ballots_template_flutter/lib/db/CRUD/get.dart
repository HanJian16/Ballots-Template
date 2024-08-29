import 'package:ballots_template_flutter/db/index.dart';

Future<List<Map<String, dynamic>>> getStore() async {
  final db = await DatabaseHelper().database;
  return await db.query('store');
}

Future<List<Map<String, dynamic>>> getHistory() async {
  final db = await DatabaseHelper().database;
  return await db.query('history');
}
