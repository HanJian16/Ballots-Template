import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/invoice/invoice_tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/widgets/appbar_title_with_icon.dart';
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

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    var invoiceActionIcons = InvoiceResources.getInvoiceActionIcons();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
