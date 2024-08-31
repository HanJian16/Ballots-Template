class Store {
  final int id;
  final String nameStore;
  final String phoneStore;
  final String addressStore;
  final String emailStore;
  final String rucStore;
  final String signerName;
  final String signerRole;

  Store({
    required this.id,
    required this.nameStore,
    required this.phoneStore,
    required this.addressStore,
    required this.emailStore,
    required this.rucStore,
    required this.signerName,
    required this.signerRole,
  });

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      id: map['id'],
      nameStore: map['nameStore'],
      phoneStore: map['phoneStore'],
      addressStore: map['addressStore'],
      emailStore: map['emailStore'],
      rucStore: map['rucStore'],
      signerName: map['signerName'],
      signerRole: map['signerRole'],
    );
  }
}
