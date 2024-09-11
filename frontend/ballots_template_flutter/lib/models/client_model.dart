class Client {
  final int id;
  final String name;
  final String phone;
  final String document;
  final String address;
  final int storeId;

  Client({
    required this.id,
    required this.name,
    required this.phone,
    required this.document,
    required this.address,
    required this.storeId,
  });

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      document: map['document'],
      address: map['address'],
      storeId: map['storeId'],
    );
  }
}
