import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

void navigateToAnotherScreen(action, String title) async {
  var store = await getStore();

  if (store != null || title == 'Ajustes') {
    action();
  } else {
    WarningDialogHelper.show(
      message: '¡Aplicación no configurada!',
      confirmText: "Ir a configurar",
      confirmOnPress: () {
        Get.back();
        Get.toNamed(AppRoutes.settings);
      },
    );
  }
}

getListTileData() {
  List<Map<String, dynamic>> listTileData = [
    {
      'title': 'Recibo',
      'subtitle': 'Crear recibos de productos o servicios',
      'icon': Icons.receipt_long_outlined,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(() => Get.toNamed(AppRoutes.invoice), 'Recibo');
      }
    },
    {
      'title': 'Registros',
      'subtitle': 'Registros de productos y servicios',
      'icon': Icons.content_paste_rounded,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(
            () => Get.toNamed(AppRoutes.registrations), 'Registros');
      }
    },
    {
      'title': 'Lista de Productos / Servicios',
      'subtitle': 'Lista de productos y servicios',
      'icon': Icons.content_paste_search,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(() {
          Get.toNamed(AppRoutes.generalList);
        }, 'Lista de Productos / Servicios');
      }
    },
    {
      'title': 'Presupuestos',
      'subtitle': 'Presupuestos de productos y servicios',
      'icon': Icons.calculate_outlined,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Presupuestos');
      }
    },
    {
      'title': 'Clientes',
      'subtitle': 'Lista de clientes',
      'icon': Icons.people_outline,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(
            () => Get.toNamed(AppRoutes.clients), 'Clientes');
      }
    },
    {
      'title': 'Historial',
      'subtitle': 'Historial de productos y servicios',
      'icon': Icons.history,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Historial');
      }
    },
    {
      'title': 'Ajustes',
      'subtitle': 'Configuraciones de la aplicación',
      'icon': Icons.settings_sharp,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(
          () => Get.toNamed(AppRoutes.settings),
          'Ajustes',
        );
      }
    },
  ];

  return listTileData;
}
