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

Future<void> insertHistory(
  String storeId,
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
  String storeId,
  String date,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('product', <String, dynamic>{
    'productName': productName,
    'productDescription': productDescription,
    'productValue': productValue,
    'storeId': storeId,
    'date': date,
  });
}

Future<void> insertService(
  String description,
  double value,
  String storeId,
  String date,
) async {
  final db = await DatabaseHelper().database;
  await db.insert('service', <String, dynamic>{
    'description': description,
    'value': value,
    'storeId': storeId,
    'date': date,
  });
}
