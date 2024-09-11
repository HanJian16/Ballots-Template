class Service {
  final int id;
  final String description;
  final double value;
  final int storeId;

  Service({
    required this.id,
    required this.description,
    required this.value,
    required this.storeId,
  });

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'],
      description: map['description'],
      value: map['value'].toDouble(),
      storeId: map['storeId'],
    );
  }
}
