import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class InvoiceMenuScreen extends StatelessWidget {
  const InvoiceMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
      title: 'Recibo',
      children: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Crear recibos de productos o servicios',
              style: theme.titleLarge,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: MenuList(list: InvoiceResources.invoiceMenuOptions),
            ),
          ],
        ),
      ),
    );
  }
}
