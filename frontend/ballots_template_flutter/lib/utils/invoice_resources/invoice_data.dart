import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class InvoiceResources {
  static List<Map<String, dynamic>> get invoiceIcons {
    return [
      {
        'icon': Icons.share,
        'onPressed': () {},
        'background': Colors.lightBlue,
      },
      {
        'icon': Icons.print_disabled,
        'onPressed': () {},
        'color': AppColors.blackColor
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
        'onPressed': () => Get.toNamed(AppRoutes.addInballotClient),
        'color': AppColors.blackColor,
      },
      {
        'icon': Icons.monetization_on,
        'onPressed': () {},
        'color': AppColors.blackColor
      },
      {
        'icon': Icons.discount,
        'onPressed': () {},
        'color': AppColors.blackColor
      },
      {
        'icon': Icons.info,
        'onPressed': () {},
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
