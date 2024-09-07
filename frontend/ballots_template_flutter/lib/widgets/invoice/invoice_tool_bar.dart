import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/db/CRUD/delete.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:get/get.dart';

class InvoiceToolBar extends StatelessWidget {
  const InvoiceToolBar({
    super.key,
    this.list,
    this.see,
    required this.type,
    this.id,
  });
  final List<Map<String, dynamic>>? list;
  final bool? see;
  final String type;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (see == true) {
              final invoiceController = Get.find<InvoiceController>();
              invoiceController.deleteAll();
            } else {
              final listController = Get.find<ListController>();
              WarningDialogHelper.show(
                title: '¡Atento!',
                message: '¿Estás seguro de querer\nborrar esta boleta?',
                confirmText: 'Borrar',
                cancelText: 'Cancelar',
                confirmOnPress: () async {
                  if (type == 'product') {
                    await deleteHistoryProduct(id!);
                    listController.getHistoryProductsDb();
                  } else if (type == 'service') {
                    await deleteHistoryService(id!);
                    listController.getHistoryServicesDb();
                  }
                  Get.back();
                  Get.back();
                },
                cancelOnPress: () {
                  Get.back();
                },
              );
            }
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          constraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(AppColors.errorColor),
            shadowColor: WidgetStateProperty.all(Colors.black),
            elevation: WidgetStateProperty.all(8),
          ),
        ),
        if (list != null && see == true)
          Row(
            children: list!.map((item) {
              final icon = item['icon'];
              final onPressed = item['onPressed'];
              final color = item['color'] ?? AppColors.whiteColor;
              final background =
                  item['background'] ?? AppColors.cardColorSecondary;
              return IconButton(
                alignment: Alignment.center,
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: color,
                ),
                constraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(background),
                  shadowColor: WidgetStateProperty.all(Colors.black),
                  elevation: WidgetStateProperty.all(8),
                ),
              );
            }).toList(),
          )
      ],
    );
  }
}
