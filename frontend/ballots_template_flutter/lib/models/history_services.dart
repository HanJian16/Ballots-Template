class HistoryService {
  final int id;
  final int storeId;
  final String serviceList;
  final int clientId;
  final double total;
  final double descuento;
  final double totalPay;
  final String observations;
  final String date;

  HistoryService({
    required this.id,
    required this.storeId,
    required this.serviceList,
    required this.clientId,
    required this.total,
    required this.descuento,
    required this.totalPay,
    required this.observations,
    required this.date,
  });

  factory HistoryService.fromMap(Map<String, dynamic> map) {
    return HistoryService(
      id: map['id'],
      storeId: map['storeId'],
      serviceList: map['serviceList'],
      clientId: map['clientId'],
      total: map['total'].toDouble(),
      descuento: map['descuento'].toDouble(),
      totalPay: map['totalPay'].toDouble(),
      observations: map['observations'],
      date: map['date'],
    );
  }
}
