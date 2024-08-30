import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/appbar_title_with_icon.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';

class ProductInvoiceScreen extends StatelessWidget {
  const ProductInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = [
      {
        'icon': Icons.share,
        'onPressed': () {
          print('hola');
        },
        'background': Colors.lightBlue
      },
      {
        'icon': Icons.print_disabled,
        'onPressed': () {
          print('hola2');
        },
        'color': AppColors.blackColor
      },
    ];
    return ScreenContainer(
      appBarChildren: Column(
        children: [
          AppBarTitleWithIcon(
            text: 'Recibo del producto',
            icon: Icons.receipt_rounded,
            onPressed: () {},
            list: list,
          ),
        ],
      ),
      children: const Text('Product Invoice'),
    );
  }
}
