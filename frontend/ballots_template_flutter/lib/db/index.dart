import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ballots_template_flutter.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS store (
        id INTEGER PRIMARY KEY,
        nameStore TEXT,
        phoneStore TEXT,
        addressStore TEXT,
        emailStore TEXT,
        rucStore TEXT,
        signerName TEXT,
        signerRole TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS history (
        id INTEGER PRIMARY KEY,
        storeId INTEGER,
        date TEXT,
        total TEXT,
        Foreign Key (storeId) REFERENCES store(id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS product (
        id INTEGER PRIMARY KEY,
        productName TEXT,
        productDescription TEXT,
        productValue NUMERIC,
        storeId INTEGER,
        date TEXT,
        FOREIGN KEY (storeId) REFERENCES store(id) ON DELETE CASCADE
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS service (
        id INTEGER PRIMARY KEY,
        description TEXT,
        value NUMERIC,
        storeId INTEGER,
        date TEXT,
        FOREIGN KEY (storeId) REFERENCES store(id) ON DELETE CASCADE
      )
      ''');
  }
}
