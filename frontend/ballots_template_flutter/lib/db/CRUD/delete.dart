import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> deleteDb() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'ballots_template_flutter.db');
  return await deleteDatabase(path);
}
