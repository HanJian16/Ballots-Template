import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:flutter/material.dart';

class HistoryMenuList extends StatelessWidget {
  const HistoryMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      {
        'title': 'Historial de Productos',
        'subtitle': 'Productos registrados',
        'icon': Icons.receipt_long_outlined,
        "selected": true,
        "onTap": () {}
      },
      {
        'title': 'Historial de Servicios',
        'subtitle': 'Servicios registrados',
        'icon': Icons.receipt_long_outlined,
        "selected": true,
        "onTap": () {}
      }
    ];
    return ScreenContainer(
      title: 'Historial',
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: MenuList(list: list),
      ),
    );
  }
}
