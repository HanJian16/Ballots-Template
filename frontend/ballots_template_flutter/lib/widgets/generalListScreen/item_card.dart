import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    this.onPress,
    required this.category,
  });

  final int id;
  final String title;
  final String subtitle;
  final VoidCallback? onPress;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          if (onPress != null) {
            onPress!();
          }
        },
        title: Text(title),
        subtitle: Text('Valor: $subtitle'),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
