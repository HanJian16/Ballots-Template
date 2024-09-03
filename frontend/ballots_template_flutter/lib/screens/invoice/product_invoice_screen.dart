import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/CRUD/get.dart';
import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class ProductInvoiceScreen extends StatefulWidget {
  const ProductInvoiceScreen({super.key, required this.category});
  final String category;

  @override
  State<ProductInvoiceScreen> createState() => _ProductInvoiceScreenState();
}

class _ProductInvoiceScreenState extends State<ProductInvoiceScreen> {
  Store? store;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final storeDB = await getStore();
    setState(() {
      store = storeDB;
    });
  }

  Widget _buildAppBarActions(List<Map<String, dynamic>> icons) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: icons.map((iconData) {
          return IconButton(
            icon: Icon(
              iconData['icon'] as IconData,
              color: iconData['color'] ?? AppColors.whiteColor,
            ),
            onPressed: iconData['onPressed'] as VoidCallback?,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  iconData['background'] ?? AppColors.greyColor),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme theme = Theme.of(context).textTheme;
    var invoiceActionIcons = InvoiceResources.getInvoiceActionIcons(category: widget.category);
    return ScreenContainer(
      floatingActionButton: AddItemBtn(
        onPress: () {
          Get.toNamed(AppRoutes.addProduct);
        },
      ),
      title: widget.category == 'Servicios' ? 'Recibo del servicio' : 'Recibo del producto',
      appBarActions: [_buildAppBarActions(InvoiceResources.invoiceIcons)],
      children: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              InvoiceToolBar(
                list: invoiceActionIcons,
              ),
              const SizedBox(
                height: 20,
              ),
              InvoicePreviewWidget(store: store, category: widget.category),
            ],
          ),
        ),
      ),
    );
  }
}
