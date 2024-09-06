class HistoryProduct {
  final int id;
  final int storeId;
  final String productList;
  final int clientId;
  final double total;
  final double descuento;
  final double totalPay;
  final String observations;
  final String date;

  HistoryProduct({
    required this.id,
    required this.storeId,
    required this.productList,
    required this.clientId,
    required this.total,
    required this.descuento,
    required this.totalPay,
    required this.observations,
    required this.date,
  });

  factory HistoryProduct.fromMap(Map<String, dynamic> map) {
    return HistoryProduct(
      id: map['id'],
      storeId: map['storeId'],
      productList: map['productList'],
      clientId: map['clientId'],
      total: map['total'].toDouble(),
      descuento: map['descuento'].toDouble(),
      totalPay: map['totalPay'].toDouble(),
      observations: map['observations'],
      date: map['date'],
    );
  }
}
