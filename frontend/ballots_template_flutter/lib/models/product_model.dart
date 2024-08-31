// lib/models/product.dart
class Product {
  final int id;
  final String productName;
  final String productDescription;
  final double productValue;
  final int storeId;
  final DateTime date;

  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productValue,
    required this.storeId,
    required this.date,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      productName: map['productName'],
      productDescription: map['productDescription'],
      productValue: map['productValue'].toDouble(),
      storeId: map['storeId'],
      date: DateTime.parse(map['date']),
    );
  }
}
