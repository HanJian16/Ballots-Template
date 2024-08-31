import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class NewProductController extends GetxController {
  var productName = TextEditingController();
  var productDescription = TextEditingController();
  var productValue = TextEditingController();

  validateProductName(String value) {
    if (value.isEmpty) {
      return 'El nombre del producto es requerido';
    }
    return null;
  }

  validateProductDescription(String value) {
    if (value.isEmpty) {
      return 'La descripción del producto es requerida';
    }
    return null;
  }

  validateProductValue(String value) {
    if (value == '') {
      return 'El valor del producto es requerido';
    } else if (!RegExp(r'^\d*\.?\d+$').hasMatch(value)) {
      return 'El valor del producto debe ser un número';
    }
    return null;
  }

  void cleanController() {
    productName.text = '';
    productDescription.text = '';
    productValue.text = '';
  }

  void submitForm() async {
    try {
      await insertProduct(
        productName.text,
        productDescription.text,
        double.parse(productValue.text),
        '1',
        DateTime.now().toIso8601String(),
      );

      NotificationHelper.show(
        title: 'Éxito',
        message: 'El producto se ha guardado correctamente',
        isError: false,
      );

      cleanController();

      Get.toNamed(AppRoutes.home);
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: '$e',
        isError: true,
      );
    }
  }
}
