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
  Uint8List signature,
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
    'signature': signature,
  });
}

Future<void> insertSignature(int storeId, Uint8List signatureBytes) async {
  final db = await DatabaseHelper().database;
  await db.update(
    'store',
    {
      'signature': signatureBytes
    }, // Asegúrate de que la columna 'signature' exista en tu tabla
    where: 'id = ?',
    whereArgs: [storeId],
  );
}

Future<void> insertHistoryProduct(
  int storeId,
  String productList,
  int clientId,
  double total,
  double descuento,
  double totalPay,
  String observations,
  String date,
  String discountType,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('historyProduct', <String, dynamic>{
    'storeId': storeId,
    'productList': productList,
    'clientId': clientId,
    'total': total,
    'descuento': descuento,
    'totalPay': totalPay,
    'observations': observations,
    'date': date,
    'discountType': discountType,
  });
}

Future<void> insertHistoryService(
  int storeId,
  String serviceList,
  int clientId,
  double total,
  double descuento,
  double totalPay,
  String observations,
  String date,
  String discountType,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('historyService', <String, dynamic>{
    'storeId': storeId,
    'serviceList': serviceList,
    'clientId': clientId,
    'total': total,
    'descuento': descuento,
    'totalPay': totalPay,
    'observations': observations,
    'date': date,
    'discountType': discountType,
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
