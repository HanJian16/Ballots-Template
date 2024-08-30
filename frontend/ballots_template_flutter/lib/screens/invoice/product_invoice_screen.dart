import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/widgets/appbar_title_with_icon.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:ballots_template_flutter/utils/invoice_resources/invoice_data.dart';

class ProductInvoiceScreen extends StatelessWidget {
  const ProductInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      appBarChildren: Column(
        children: [
          AppBarTitleWithIcon(
            text: 'Recibo del producto',
            icon: Icons.receipt_rounded,
            onPressed: () {},
            list: InvoiceResources.invoiceIcons,
          ),
        ],
      ),
      children: const Text('Product Invoice'),
    );
  }
}
