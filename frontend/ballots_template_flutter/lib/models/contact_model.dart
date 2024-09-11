class ContactModel {
  final String name;
  final String phone;

  ContactModel({required this.name, required this.phone});

  // Método para crear una instancia de Contact desde un Map
  factory ContactModel.fromMap(Map<dynamic, dynamic> map) {
    return ContactModel(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Contact{name: $name, phone: $phone}';
  }
}
