import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/utils/invoice_resources/invoice_data.dart';
import 'package:ballots_template_flutter/widgets/menu_list.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
      appBarChildren: Text(
        'Recibo',
        style: theme.headlineLarge?.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
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
