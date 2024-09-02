import 'dart:typed_data';

import 'package:ballots_template_flutter/db/main.dart';

Future<void> insertStore(
  String name,
  String email,
  String phone,
  String direction,
  String ruc,
  String nameOfFirm,
  String positionOfFirm,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('store', <String, dynamic>{
    'nameStore': name,
    'phoneStore': phone,
    'addressStore': direction,
    'emailStore': email,
    'rucStore': ruc,
    'signerName': nameOfFirm,
    'signerRole': positionOfFirm,
  });
}

Future<void> insertSignature(int storeId, Uint8List signatureBytes) async {
  final db = await DatabaseHelper().database;
  await db.update(
    'store', 
    {'signature': signatureBytes}, // Asegúrate de que la columna 'signature' exista en tu tabla
    where: 'id = ?', 
    whereArgs: [storeId],
  );
}

Future<void> insertHistory(
  int storeId,
  String date,
  String total,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('history', <String, dynamic>{
    'storeId': storeId,
    'date': date,
    'total': total,
  });
}

Future<void> insertProduct(
  String productName,
  String productDescription,
  double productValue,
  int storeId,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('product', <String, dynamic>{
    'productName': productName,
    'productDescription': productDescription,
    'productValue': productValue,
    'storeId': storeId,
  });
}

Future<void> insertService(
  String description,
  double value,
  int storeId,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('service', <String, dynamic>{
    'description': description,
    'value': value,
    'storeId': storeId,
  });
}

Future<void> insertClient(
  String name,
  String phone,
  String document,
  String address,
  int storeId,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('client', <String, dynamic>{
    'name': name,
    'phone': phone,
    'document': document,
    'address': address,
    'storeId': storeId,
  });
}
