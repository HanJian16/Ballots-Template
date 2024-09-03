import 'dart:io';

import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
        nameStore TEXT REQUIRED,
        phoneStore TEXT REQUIRED,
        addressStore TEXT REQUIRED,
        emailStore TEXT REQUIRED,
        rucStore TEXT REQUIRED,
        signerName TEXT REQUIRED,
        signerRole TEXT REQUIRED,
        signature BLOB REQUIRED
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

    await db.execute('''
      CREATE TABLE IF NOT EXISTS client (
        id INTEGER PRIMARY KEY,
        name TEXT,
        phone TEXT,
        document TEXT,
        address TEXT,
        storeId INTEGER,
        FOREIGN KEY (storeId) REFERENCES store(id) ON DELETE CASCADE
      )
      ''');
  }
}

Future<void> backupDb() async {
  var status = await Permission.storage.status;

  if (!status.isGranted) {
    await Permission.storage.request();
  }

  final dbDir = await getDatabasesPath();
  final dbPath = join(dbDir, 'ballots_template_flutter.db');

  Directory? downloadDir;
  if (GetPlatform.isAndroid) {
    downloadDir = await getExternalStorageDirectory();
  } else if (GetPlatform.isIOS) {
    downloadDir = await getApplicationDocumentsDirectory();
  }

  final backupPath = join(downloadDir!.path, 'ballots_template_flutter.db');

  final dbFile = File(dbPath);
  final backupFile = File(backupPath);

  await backupFile.writeAsBytes(await dbFile.readAsBytes());
}

Future<void> restoreDb() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.any,
  );

  if (result != null) {
    final path = result.files.single.path;
    File backupFile = File(path!);

    final dbDir = await getDatabasesPath();
    final dbPath = join(dbDir, 'ballots_template_flutter.db');

    final dbFile = File(dbPath);
    await dbFile.writeAsBytes(await backupFile.readAsBytes());

    Get.find<SettingsController>().onInit();
  } else {
    NotificationHelper.show(
      title: 'No file selected',
      message: 'Please select a file',
    );
  }
}
