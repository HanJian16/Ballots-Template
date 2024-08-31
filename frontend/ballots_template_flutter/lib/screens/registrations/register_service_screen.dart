import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';

class RegisterServiceScreen extends StatelessWidget {
  const RegisterServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      appBarChildren: const Text('Registro de servicio'),
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Descripción'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Valor del servicio'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
