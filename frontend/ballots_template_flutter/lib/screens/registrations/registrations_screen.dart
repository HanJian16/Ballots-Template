import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class RegistrationsScreen extends StatelessWidget {
  const RegistrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'title': 'Registro del producto',
        'subtitle': 'Crear recibo del producto',
        'icon': Icons.ballot,
        'onTap': () => Get.toNamed(AppRoutes.registerProduct),
      },
      {
        'title': 'Registro de servicio',
        'subtitle': 'Crear recibo del servicio',
        'icon': Icons.ballot_outlined,
        'onTap': () => Get.toNamed(AppRoutes.registerService),
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
