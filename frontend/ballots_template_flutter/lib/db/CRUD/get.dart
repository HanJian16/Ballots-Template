import 'package:ballots_template_flutter/db/index.dart';

Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await DatabaseHelper().database;
  return await db.query('users');
}
