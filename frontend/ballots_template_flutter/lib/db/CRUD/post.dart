import 'package:ballots_template_flutter/db/index.dart';

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
