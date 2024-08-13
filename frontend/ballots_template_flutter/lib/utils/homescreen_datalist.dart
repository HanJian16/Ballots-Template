import 'package:flutter/material.dart';

getListTileData() {
  List listTileData = [
    {
      'title': 'Recibo',
      'subtitle': 'Crear recibos de productos o servicios',
      'icon': Icons.receipt_long_outlined,
    },
    {
      'title': 'Registros',
      'subtitle': 'Registros de productos y servicios',
      'icon': Icons.content_paste_rounded,
    },
    {
      'title': 'Lista de productos/servicios',
      'subtitle': 'Lista de productos y servicios',
      'icon': Icons.content_paste_search,
    },
    {
      'title': 'Presupuestos',
      'subtitle': 'Presupuestos de productos y servicios',
      'icon': Icons.format_list_bulleted_add,
    },
    {
      'title': 'Clientes',
      'subtitle': 'Lista de clientes',
      'icon': Icons.format_list_bulleted_add
    },
    {
      'title': 'Historial',
      'subtitle': 'Historial de recibos',
      'icon': Icons.format_list_bulleted_add,
    },
    {
      'title': 'Ajustes',
      'subtitle': 'Configuraciones de la aplicación',
      'icon': Icons.format_list_bulleted_add,
    }
  ];

  return listTileData;
}
