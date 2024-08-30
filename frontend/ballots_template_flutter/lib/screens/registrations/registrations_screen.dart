import 'package:ballots_template_flutter/widgets/menu_list.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';

class RegistrationsScreen extends StatelessWidget {
  const RegistrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'title': 'Registro del producto',
        'subtitle': 'Crear recibo del producto',
        'icon': Icons.ballot,
      },
      {
        'title': 'Registro de servicio',
        'subtitle': 'Crear recibo del servicio',
        'icon': Icons.ballot_outlined,
      },
    ];

    return ScreenContainer(
      appBarChildren: const Text('Registros'),
      children: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Crear registros de productos y servicios',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: MenuList(list: list),
            ),
          ],
        ),
      ),
    );
  }
}
