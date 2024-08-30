import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/menu_list.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'title': 'Recibo del producto',
        'subtitle': 'Crear recibo del producto',
        'icon': Icons.receipt_rounded,
        'onTap': () {
          print('Navegando a ${AppRoutes.productInvoice}');
          Get.toNamed(AppRoutes.productInvoice);
        }
      },
      {
        'title': 'Recibo del servicio',
        'subtitle': 'Crear recibo del servicio',
        'icon': Icons.receipt_outlined,
        'onTap': () {
          Get.toNamed(AppRoutes.serviceInvoice);
        }
      }
    ];
    final TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
      appBarChildren: Text(
        'Recibo',
        style: theme.headlineLarge?.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
      children: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Crear recibos de productos o servicios',
              style: theme.titleLarge,
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              child: MenuList(list: list),
            ),
          ],
        ),
      ),
    );
  }
}
