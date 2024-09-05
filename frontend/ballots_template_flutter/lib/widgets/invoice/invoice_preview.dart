import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class InvoicePreviewWidget extends StatelessWidget {
  const InvoicePreviewWidget({
    super.key,
    required this.store,
    required this.category,
  });

  final Store? store;
  final String category;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    final InvoiceController invoiceController = Get.find<InvoiceController>();
    final ScreenshotControllerGetx screenshotController = Get.find<ScreenshotControllerGetx>();

    return Screenshot(
      controller: screenshotController.screenshotController,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          // color: AppColors.cardColorSecondary,
          border: Border.all(color: AppColors.blackColor, width: 0.8),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StoreInfoWidget(store: store),
                const Divider(
                  color: AppColors.blackColor,
                ),
                const ClientInfoWidget(),
                const Divider(
                  color: AppColors.blackColor,
                ),
                Text(
                  category == 'product' ? 'Productos' : 'Servicios',
                  style: theme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ListForInvoice(type: category),
                Obx(
                  () {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Total: ${invoiceController.total}'),
                          Text('Descuento: ${invoiceController.descuento}'),
                          Text(
                            'Total a pagar: ${invoiceController.totalPay}',
                            style: theme.titleLarge
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Obx(
                  () {
                    final appear = invoiceController.boolObservations.value;
      
                    return Container(
                      padding: appear
                          ? const EdgeInsets.symmetric(vertical: 20)
                          : null,
                      width: double.infinity,
                      child: appear
                          ? Text(
                              'Observaciones:\n${invoiceController.observations.value}',
                              textAlign: TextAlign.start,
                            )
                          : null,
                    );
                  },
                ),
                const Divider(
                  color: AppColors.blackColor,
                ),
                if (store != null)
                  SignatureDisplayInfo(
                    store: store,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListForInvoice extends StatelessWidget {
  const ListForInvoice({
    super.key,
    required this.type,
  });
  final String type;

  @override
  Widget build(BuildContext context) {
    final invoiceController = Get.find<InvoiceController>();
    final listProducts = invoiceController.listProducts;
    final listServices = invoiceController.listServices;

    return Obx(
      () {
        return Column(
          children: type == 'product'
              ? listProducts.asMap().entries.map((entry) {
                  return ListForInvoiceItem(
                    item: entry.value,
                    id: entry.key,
                    type: type,
                  );
                }).toList()
              : listServices.asMap().entries.map((entry) {
                  return ListForInvoiceItem(
                    item: entry.value,
                    id: entry.key,
                    type: type,
                  );
                }).toList(),
        );
      },
    );
  }
}

class ListForInvoiceItem extends StatelessWidget {
  const ListForInvoiceItem({
    super.key,
    required this.id,
    required this.item,
    required this.type,
  });
  final Map item;
  final int id;
  final String type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final invoiceController = Get.find<InvoiceController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item['name'],
              style: theme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                if (type == 'product') {
                  invoiceController.removeProductList(id);
                } else if (type == 'service') {
                  invoiceController.removeServiceList(id);
                }
              },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cant: ${item['amount'].toString()}'),
            Text('Valor: ${item['value'].toString()}'),
            Text('Total: ${item['total'].toString()}'),
            const Text(''),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
