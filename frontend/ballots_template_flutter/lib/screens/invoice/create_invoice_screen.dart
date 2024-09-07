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
    final historyId = Get.arguments;
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
            onPressed: () async {
              final screenshotController = Get.find<ScreenshotControllerGetx>();
              final invoiceController = Get.find<InvoiceController>();
              int invoiceId = 0;
              if (widget.category == 'service') {
                final listProdcts = await getHistoryProducts();
                invoiceId = listProdcts.isNotEmpty ? listProdcts.length + 1 : 0;
              } else if (widget.category == 'product') {
                final listServices = await getHistoryServices();
                invoiceId =
                    listServices.isNotEmpty ? listServices.length + 1 : 0;
              }
              final isShared =
                  await screenshotController.captureAndShare(invoiceId);
              if (isShared) {
                if (widget.category == 'service' && historyId == null) {
                  invoiceController.createHistoryService();
                  Get.back();
                } else if (widget.category == 'service' && historyId == null) {
                  invoiceController.createHistoryProduct();
                  Get.back();
                }
              }
            },
            icon: const Icon(Icons.share)),
        Obx(() {
          final screenshotController = Get.find<ScreenshotControllerGetx>();
          return IconButton(
            onPressed: () async {
              if (screenshotController.isConnected.value == true) {
                final invoiceController = Get.find<InvoiceController>();
                bool isPrinted = await screenshotController.printTicket();
                if (isPrinted) {
                  if (widget.category == 'service' && historyId == null) {
                    invoiceController.createHistoryService();
                  } else if (widget.category == 'product' &&
                      historyId == null) {
                    invoiceController.createHistoryProduct();
                  }
                  Get.defaultDialog(
                    middleText: '¿Deseas imprimir una copia?',
                    confirm: CustomBtn(
                      text: 'Confirmar',
                      onPressed: () async {
                        await screenshotController.printTicket();
                        Get.back();
                        Get.back();
                      },
                      status: 1,
                    ),
                    cancel: CustomBtn(
                      text: 'Cancelar',
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                      status: 1,
                    ),
                  );
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
                see: historyId == null,
              ),
              const SizedBox(
                height: 20,
              ),
              InvoicePreviewWidget(
                store: store,
                category: widget.category,
                historyId: historyId != null ? historyId! : null,
              ),
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
