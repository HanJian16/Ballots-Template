import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/add_item_btn.dart';
import 'package:ballots_template_flutter/widgets/invoice/invoice_tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:ballots_template_flutter/utils/invoice_resources/invoice_data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductInvoiceScreen extends StatefulWidget {
  const ProductInvoiceScreen({super.key});

  @override
  State<ProductInvoiceScreen> createState() => _ProductInvoiceScreenState();
}

class _ProductInvoiceScreenState extends State<ProductInvoiceScreen> {
  late Map<String, dynamic> invoiceData;
  @override
  void initState() {
    super.initState();
    final box = GetStorage();
    invoiceData = box.read('storeData') ?? {};
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
        onPress: () {},
      ),
      appBarChildren: Text(
        'Recibo del producto',
        style: theme.headlineLarge?.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
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
              Container(
                width: double.infinity,
                height: Get.height * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.blackColor, width: 0.8),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          invoiceData['nameStore'] ?? '',
                          style: theme.headlineLarge,
                        ),
                        Text(invoiceData['rucStore'] ?? '',
                            style: theme.bodySmall),
                        Text(invoiceData['addressStore'] ?? '',
                            style: theme.bodySmall),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Teléfono:${invoiceData['phoneStore'] ?? ''}',
                                style: theme.bodySmall),
                            Text(
                              ' | ',
                              style: theme.bodySmall,
                            ),
                            Text('${invoiceData['emailStore'] ?? ''}',
                                style: theme.bodySmall),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
