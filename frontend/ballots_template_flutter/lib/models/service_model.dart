class Service {
  final int id;
  final String description;
  final double value;
  final int storeId;
  final DateTime date;

  Service({
    required this.id,
    required this.description,
    required this.value,
    required this.storeId,
    required this.date,
  });

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'],
      description: map['description'],
      value: map['value'].toDouble(),
      storeId: map['storeId'],
      date: DateTime.parse(map['date']),
    );
  }
}
