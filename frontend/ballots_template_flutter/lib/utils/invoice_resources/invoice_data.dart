import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class InvoiceResources {
  static List<Map<String, dynamic>> get invoiceIcons {
    final controller = Get.find<ScreenshotControllerGetx>();
    return [
      {
        'icon': Icons.share,
        'onPressed': () {},
        'background': Colors.lightBlue,
      },
      {
        'icon': Icons.print_disabled,
        'onPressed': () async {
          if (controller.isConnected.value == true) {
            controller.printTicket();
          } else {
            Get.toNamed(AppRoutes.bluetoohConnect);
          }
        },
        'background': controller.isConnected.value == true
            ? AppColors.successColor
            : AppColors.errorColor,
      },
    ];
  }

  static List<Map<String, dynamic>> get invoiceMenuOptions {
    return [
      {
        'title': 'Recibo del producto',
        'subtitle': 'Crear recibo del producto',
        'icon': Icons.receipt_rounded,
        'onTap': () {
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
  }

  static List<Map<String, dynamic>> getInvoiceActionIcons(
      {String category = ''}) {
    List<Map<String, dynamic>> icons = [
      {
        'icon': Icons.person_search_rounded,
        'onPressed': () => Get.toNamed(AppRoutes.addInBallotClient),
        'color': AppColors.blackColor,
      },
      {
        'icon': Icons.discount,
        'onPressed': () {
          final invoiceController = Get.find<InvoiceController>();
          var totalPay = invoiceController.totalPay.value;
          final formKey = GlobalKey<FormState>();
          final editingController = TextEditingController();
          validate(String val) {
            if (editingController.text.isEmpty) {
              return 'Debe ingresar un valor';
            } else if (invoiceController.checkbox.value == false &&
                double.parse(editingController.text) > 100) {
              return 'El descuento no puede\nser mayor a 100%';
            } else if (invoiceController.checkbox.value == true &&
                double.parse(editingController.text) > totalPay) {
              return 'El descuento no puede\nser mayor al total';
            }
            return null;
          }

          Get.defaultDialog(
              title: 'Aplicar descuento',
              titlePadding: const EdgeInsets.only(top: 20),
              contentPadding: const EdgeInsets.all(20),
              content: Form(
                key: formKey,
                child: Column(
                  children: [
                    Obx(
                      () {
                        bool value = invoiceController.checkbox.value;
                        onTap() {
                          invoiceController.checkbox.value = !value;
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CheckBoxCustom(
                              text: 'Cantidad',
                              value: value,
                              onTap: onTap,
                            ),
                            CheckBoxCustom(
                              text: 'Porcentaje',
                              value: !value,
                              onTap: onTap,
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: editingController,
                      decoration: const InputDecoration(
                        hintText: 'Valor de descuento',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) => validate(value!),
                    )
                  ],
                ),
              ),
              onConfirm: () {
                if (validateAndSaveForm(formKey)) {
                  invoiceController.descuento.value =
                      double.parse(editingController.text);
                  invoiceController.calculateDiscount();
                  Get.back();
                }
              },
              textConfirm: 'Aplicar',
              buttonColor: AppColors.primaryColor);
        },
        'color': AppColors.blackColor
      },
      {
        'icon': Icons.info,
        'onPressed': () {
          final invoiceController = Get.find<InvoiceController>();
          final formKey = GlobalKey<FormState>();
          final editingController = TextEditingController();
          validator(String value) {
            if (value.isEmpty) {
              return 'Debe ingresar una observación';
            }
            return null;
          }

          Get.defaultDialog(
            title: 'Observaciones',
            titlePadding: const EdgeInsets.only(top: 20),
            contentPadding: const EdgeInsets.all(20),
            content: Form(
              key: formKey,
              child: TextFormField(
                controller: editingController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 20,
                validator: (value) => validator(value!),
              ),
            ),
            confirm: CustomBtn(
              text: 'Agregar',
              status: 1,
              onPressed: () {
                if (validateAndSaveForm(formKey)) {
                  invoiceController.observations.value = editingController.text;
                  invoiceController.boolObservations.value = true;
                  Get.back();
                }
              },
            ),
            cancel: CustomBtn(
              text: 'Cancelar',
              status: 1,
              customColor: AppColors.errorColor,
              onPressed: () => Get.back(),
            ),
          );
        },
        'color': AppColors.blackColor,
      },
    ];

    if (category == 'Servicios') {
      icons.add({
        'icon': Icons.settings,
        'onPressed': () {},
        'color': AppColors.blackColor
      });
    }

    return icons;
  }
}

class CheckBoxCustom extends StatelessWidget {
  const CheckBoxCustom({
    super.key,
    required this.text,
    required this.value,
    required this.onTap,
  });
  final String text;
  final bool value;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryColor,
                width: 3,
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: value
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 5),
        Text(text)
      ],
    );
  }
}
