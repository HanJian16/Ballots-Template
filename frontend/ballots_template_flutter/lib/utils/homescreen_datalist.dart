import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/widgets/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void navigateToAnotherScreen(action, String title) {
  final FormController formController = Get.find();

  if (formController.isFormValid || title == 'Ajustes') {
    action();
  } else {
    Get.defaultDialog(
      title: '',
      titleStyle: GoogleFonts.onest(
        fontSize: 1,
      ),
      content: WarningDialog(
        title: '¡Aplicación no configurada!',
        titleBtn: "Ir a configurar",
        onPress: () {
          Get.back();
          Get.toNamed(AppRoutes.formRegister);
        },
      ),
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
      'title': 'Recibo del servicio',
      'subtitle': 'Crear recibo del servicio',
      'icon': Icons.receipt_rounded,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Recibo del servicio');
      }
    },
    {
      'title': 'Recibo del producto',
      'subtitle': 'Crear recibo del producto',
      'icon': Icons.receipt_rounded,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Recibo del producto');
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
      'title': 'Registro del producto',
      'subtitle': 'Registrar producto',
      'icon': Icons.content_paste_go,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Registro del producto');
      }
    },
    {
      'title': 'Registro de servicio',
      'subtitle': 'Registrar servicio',
      'icon': Icons.content_paste_go,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Registro de servicio');
      }
    },
    {
      'title': 'Lista de Productos / Servicios',
      'subtitle': 'Lista de productos y servicios',
      'icon': Icons.content_paste_search,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Lista de Productos / Servicios');
      }
    },
    {
      'title': 'Lista de Productos',
      'subtitle': 'Listar todos los productos',
      'icon': Icons.list,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Lista de Productos');
      }
    },
    {
      'title': 'Lista de servicios',
      'subtitle': 'Listar todos los servicios',
      'icon': Icons.list,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Lista de servicios');
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
      "onTap": () {}
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
      'title': 'Historial de recepción de productos',
      'subtitle': 'Historial de recepción de productos',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Historial de recepción de productos');
      }
    },
    {
      'title': 'Historial de recibos de servicio',
      'subtitle': 'Historial de recepción de servicios',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Historial de recibos de servicio');
      }
    },
    {
      'title': 'Historial de presupuesto',
      'subtitle': 'Presupuesto de productos o s...',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Historial de presupuesto');
      }
    },
    {
      'title': 'Planes Premium',
      'subtitle': 'Conviértase en un usuario premium y 0...',
      'icon': Icons.workspace_premium,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(() {}, 'Planes Premium');
      }
    },
    {
      'title': 'Ajustes',
      'subtitle': 'Configuraciones de la aplicación',
      'icon': Icons.settings_sharp,
      "selected": true,
      "onTap": () {
        navigateToAnotherScreen(
          () => Get.toNamed(AppRoutes.formRegister),
          'Ajustes',
        );
      }
    },
  ];

  return listTileData;
}
