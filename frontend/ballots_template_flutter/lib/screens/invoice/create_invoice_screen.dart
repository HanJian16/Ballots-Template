import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key, required this.category});
  final String category;

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  Store? store;

  @override
  void initState() {
    super.initState();
    getData();
    clearInvoice();
  }

  getData() async {
    final storeDB = await getStore();
    setState(() {
      store = storeDB;
    });
  }

  clearInvoice() {
    final invoiceController = Get.find<InvoiceController>();
    invoiceController.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    final history = Get.arguments as HistoryProduct;
    var invoiceActionIcons =
        InvoiceResources.getInvoiceActionIcons(category: widget.category);
    return ScreenContainer(
      floatingActionButton: AddItemBtn(
        onPress: () {
          if (widget.category == 'service') {
            Get.toNamed(AppRoutes.addInBallotService);
          } else {
            Get.toNamed(AppRoutes.addInBallotProduct);
          }
        },
      ),
      title: widget.category == 'service'
          ? 'Recibo del servicio'
          : 'Recibo del producto',
      appBarActions: [
        IconButton(
            onPressed: () {
              final screenshotController = Get.find<ScreenshotControllerGetx>();
              final invoiceController = Get.find<InvoiceController>();
              bool boolShare = false;
              if (widget.category == 'service') {
                boolShare = invoiceController.createHistoryService();
              } else {
                boolShare = invoiceController.createHistoryProduct();
              }
              if (boolShare) {
                screenshotController.captureAndShare(0);
              } else {
                NotificationHelper.show(
                  title: 'Error',
                  message: widget.category == 'service'
                      ? 'No se pudo crear el recibo del servicio'
                      : 'No se pudo crear el recibo del producto',
                  isError: true,
                );
              }
            },
            icon: const Icon(Icons.share)),
        Obx(() {
          final screenshotController = Get.find<ScreenshotControllerGetx>();
          return IconButton(
            onPressed: () async {
              if (screenshotController.isConnected.value == true) {
                final invoiceController = Get.find<InvoiceController>();
                bool boolPrint = false;
                if (widget.category == 'service') {
                  boolPrint = invoiceController.createHistoryService();
                } else {
                  boolPrint = invoiceController.createHistoryProduct();
                }
                if (boolPrint) {
                  screenshotController.printTicket();
                }
              } else {
                Get.toNamed(AppRoutes.bluetoohConnect);
              }
            },
            icon: screenshotController.isConnected.value
                ? const Icon(Icons.print)
                : const Icon(Icons.print_disabled),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                screenshotController.isConnected.value
                    ? AppColors.successColor
                    : AppColors.errorColor,
              ),
              iconColor: WidgetStateProperty.all<Color>(
                screenshotController.isConnected.value
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
              ),
            ),
          );
        })
      ],
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
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
