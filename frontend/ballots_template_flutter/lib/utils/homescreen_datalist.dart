import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/form_register_screens.dart';

getListTileData() {
  List<Map<String, dynamic>> listTileData = [
    {
      'title': 'Recibo',
      'subtitle': 'Crear recibos de productos o servicios',
      'icon': Icons.receipt_long_outlined,
      "selected": true,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Recibo del servicio',
      'subtitle': 'Crear recibo del servicio',
      'icon': Icons.receipt_rounded,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Recibo del producto',
      'subtitle': 'Crear recibo del producto',
      'icon': Icons.receipt_rounded,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Registros',
      'subtitle': 'Registros de productos y servicios',
      'icon': Icons.content_paste_rounded,
      "selected": true,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Registro del producto',
      'subtitle': 'Registrar producto',
      'icon': Icons.content_paste_go,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Registro de servicio',
      'subtitle': 'Registrar servicio',
      'icon': Icons.content_paste_go,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Lista de Productos / Servicios',
      'subtitle': 'Lista de productos y servicios',
      'icon': Icons.content_paste_search,
      "selected": true,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Lista de Productos',
      'subtitle': 'Listar todos los productos',
      'icon': Icons.list,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Lista de servicios',
      'subtitle': 'Listar todos los servicios',
      'icon': Icons.list,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Presupuestos',
      'subtitle': 'Presupuestos de productos y servicios',
      'icon': Icons.calculate_outlined,
      "selected": true,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Clientes',
      'subtitle': 'Lista de clientes',
      'icon': Icons.people_outline,
      "selected": true,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Historial',
      'subtitle': 'Historial de productos y servicios',
      'icon': Icons.history,
      "selected": true,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Historial de recepción de productos',
      'subtitle': 'Historial de recepción de productos',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Historial de recibos de servicio',
      'subtitle': 'Historial de recepción de servicios',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Historial de presupuesto',
      'subtitle': 'Presupuesto de productos o s...',
      'icon': Icons.history,
      "selected": false,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Planes Premium',
      'subtitle': 'Conviértase en un usuario premium y 0...',
      'icon': Icons.workspace_premium,
      "selected": true,
      "onTap": () {
        print("data muajajja");
      }
    },
    {
      'title': 'Ajustes',
      'subtitle': 'Configuraciones de la aplicación',
      'icon': Icons.settings_sharp,
      "selected": true,
      "onTap": () {
        Get.to(() => const FormRegisterScreen());
      }
    },
  ];

  return listTileData;
}
