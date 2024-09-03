import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/CRUD/get.dart';
import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class ProductInvoiceScreen extends StatefulWidget {
  const ProductInvoiceScreen({super.key});

  @override
  State<ProductInvoiceScreen> createState() => _ProductInvoiceScreenState();
}

class _ProductInvoiceScreenState extends State<ProductInvoiceScreen> {
  List<Product> products = [];
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
    TextTheme theme = Theme.of(context).textTheme;
    var invoiceActionIcons = InvoiceResources.getInvoiceActionIcons();
    return ScreenContainer(
      floatingActionButton: AddItemBtn(
        onPress: () {
          Get.toNamed(AppRoutes.addProduct);
        },
      ),
      title: 'Recibo del producto',
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
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border:
                          Border.all(color: AppColors.blackColor, width: 0.8),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            StoreInfoWidget(store: store),
                            const SizedBox(height: 30),
                            Text(
                              'Producto',
                              style: theme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              color: AppColors.blackColor,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: AppColors.blackColor,
                              height: 1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (store != null)
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                        height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.memory(store!.signature),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({
    super.key,
    required this.store,
  });

  final Store? store;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          store?.nameStore ?? '',
          style: theme.headlineLarge,
        ),
        Text(store?.rucStore ?? '', style: theme.bodySmall),
        Text(store?.addressStore ?? '', style: theme.bodySmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Teléfono:${store?.phoneStore ?? ''}', style: theme.bodySmall),
            Text(
              ' | ',
              style: theme.bodySmall,
            ),
            Text(store?.emailStore ?? '', style: theme.bodySmall),
          ],
        ),
      ],
    );
  }
}
