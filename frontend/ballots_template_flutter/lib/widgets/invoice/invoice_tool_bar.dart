import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:get/get.dart';

class InvoiceToolBar extends StatelessWidget {
  const InvoiceToolBar({
    super.key,
    this.list,
  });
  final List<Map<String, dynamic>>? list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            final invoiceController = Get.find<InvoiceController>();
            invoiceController.deleteAll();
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
            backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
            shadowColor: WidgetStateProperty.all(Colors.black),
            elevation: WidgetStateProperty.all(8),
          ),
        ),
        if (list != null)
          Row(
            children: list!.map((item) {
              final icon = item['icon'];
              final onPressed = item['onPressed'];
              final color = item['color'] ?? AppColors.whiteColor;
              final background = item['background'] ?? AppColors.greyColor;
              return IconButton(
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
                  elevation: WidgetStateProperty.all(5),
                ),
              );
            }).toList(),
          )
      ],
    );
  }
}
