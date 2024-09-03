import 'package:flutter/material.dart';

class ClientInfoWidget extends StatelessWidget {
  const ClientInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('N° 0: ',
            style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text('Cliente: Prueba', style: theme.bodySmall),
        Text(
          'Documentos: 73739201',
          style: theme.bodySmall,
        ),
        Text(
          'Teléfono: 123456789',
          style: theme.bodySmall,
        ),
        Text(
          'Dirección: Av. de la República, 123',
          style: theme.bodySmall,
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
