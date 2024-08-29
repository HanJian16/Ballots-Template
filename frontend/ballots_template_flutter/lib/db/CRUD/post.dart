import 'package:ballots_template_flutter/db/index.dart';

Future<void> insertUser(String name, String email) async {
  final db = await DatabaseHelper().database;
  await db.insert('users', <String, dynamic>{
    'name': name,
    'email': email,
  });
}
