import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/routes/app_routes.dart';

class GeneralListScreenResources {
  static List<Map<String, dynamic>> get generalListMenuOptions {
    return [
      {
        'title': 'Lista de productos',
        'subtitle': 'Listar todos los productos',
        'icon': Icons.list,
        'onTap': () {
          Get.toNamed(AppRoutes.productList);
        }
      },
      {
        'title': 'Lista de servicios',
        'subtitle': 'Listar todos los servicios',
        'icon': Icons.list,
        'onTap': () {}
      }
    ];
  }
}
