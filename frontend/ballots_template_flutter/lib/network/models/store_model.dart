// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
    DateTime createdAt;
    int id;
    String nameStore;
    String phoneStore;
    String addressStore;
    String emailStore;
    String rucStore;
    String signerName;
    String signerRole;
    DateTime updatedAt;

    StoreModel({
        required this.createdAt,
        required this.id,
        required this.nameStore,
        required this.phoneStore,
        required this.addressStore,
        required this.emailStore,
        required this.rucStore,
        required this.signerName,
        required this.signerRole,
        required this.updatedAt,
    });

    factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
        nameStore: json["nameStore"],
        phoneStore: json["phoneStore"],
        addressStore: json["addressStore"],
        emailStore: json["emailStore"],
        rucStore: json["rucStore"],
        signerName: json["signerName"],
        signerRole: json["signerRole"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "id": id,
        "nameStore": nameStore,
        "phoneStore": phoneStore,
        "addressStore": addressStore,
        "emailStore": emailStore,
        "rucStore": rucStore,
        "signerName": signerName,
        "signerRole": signerRole,
        "updatedAt": updatedAt.toIso8601String(),
    };
}
