import 'dart:typed_data';

import 'package:ballots_template_flutter/db/main.dart';

Future<void> updateStore(
  String name,
  String email,
  String phone,
  String direction,
  String ruc,
  String nameOfFirm,
  String positionOfFirm,
  Uint8List signature,
) async {
  final db = await DatabaseHelper().database;
  await db.update(
    'store',
    <String, dynamic>{
      'nameStore': name,
      'phoneStore': phone,
      'addressStore': direction,
      'emailStore': email,
      'rucStore': ruc,
      'signerName': nameOfFirm,
      'signerRole': positionOfFirm,
      'signature': signature,
    },
    where: 'id = ?',
    whereArgs: [1],
  );
}

Future<void> updateClient(
  String name,
  String phone,
  String document,
  String address,
  int id,
) async {
  final db = await DatabaseHelper().database;
  await db.update(
    'client',
    <String, dynamic>{
      'name': name,
      'phone': phone,
      'document': document,
      'address': address,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> updateProduct(
  String name,
  String description,
  double value,
  int id,
) async {
  final db = await DatabaseHelper().database;
  await db.update(
    'product',
    <String, dynamic>{
      'productName': name,
      'productDescription': description,
      'productValue': value,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> updateService(
  String name,
  double value,
  int id,
) async {
  final db = await DatabaseHelper().database;
  await db.update(
    'service',
    <String, dynamic>{
      'description': name,
      'value': value,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}
