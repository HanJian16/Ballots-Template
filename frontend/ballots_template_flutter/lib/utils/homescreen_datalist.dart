import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getListTileData() {
  List<Map<String, dynamic>> listTileData = [
    {
      'title': 'Recibo',
      'subtitle': 'Crear recibos de productos o servicios',
      'icon': Icons.receipt_long_outlined,
      "selected": true,
      "onTap": () {
        Get.toNamed(AppRoutes.invoice);
      }
    },
    {
      'title': 'Recibo del servicio',
      'subtitle': 'Crear recibo del servicio',
      'icon': Icons.receipt_rounded,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Recibo del producto',
      'subtitle': 'Crear recibo del producto',
      'icon': Icons.receipt_rounded,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Registros',
      'subtitle': 'Registros de productos y servicios',
      'icon': Icons.content_paste_rounded,
      "selected": true,
      "onTap": () {}
    },
    {
      'title': 'Registro del producto',
      'subtitle': 'Registrar producto',
      'icon': Icons.content_paste_go,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Registro de servicio',
      'subtitle': 'Registrar servicio',
      'icon': Icons.content_paste_go,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Lista de Productos / Servicios',
      'subtitle': 'Lista de productos y servicios',
      'icon': Icons.content_paste_search,
      "selected": true,
      "onTap": () {}
    },
    {
      'title': 'Lista de Productos',
      'subtitle': 'Listar todos los productos',
      'icon': Icons.list,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Lista de servicios',
      'subtitle': 'Listar todos los servicios',
      'icon': Icons.list,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Presupuestos',
      'subtitle': 'Presupuestos de productos y servicios',
      'icon': Icons.calculate_outlined,
      "selected": true,
      "onTap": () {}
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
      "onTap": () {}
    },
    {
      'title': 'Historial de recepción de productos',
      'subtitle': 'Historial de recepción de productos',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Historial de recibos de servicio',
      'subtitle': 'Historial de recepción de servicios',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Historial de presupuesto',
      'subtitle': 'Presupuesto de productos o s...',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {}
    },
    {
      'title': 'Planes Premium',
      'subtitle': 'Conviértase en un usuario premium y 0...',
      'icon': Icons.workspace_premium,
      "selected": true,
      "onTap": () {}
    },
    {
      'title': 'Ajustes',
      'subtitle': 'Configuraciones de la aplicación',
      'icon': Icons.settings_sharp,
      "selected": true,
      "onTap": () {
        // Get.to(() => const FormRegisterScreen());
        Get.toNamed('/form-register');
      }
    },
  ];

  return listTileData;
}
