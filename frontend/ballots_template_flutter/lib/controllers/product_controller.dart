import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class ProductController extends GetxController {
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

  Future<bool> getProduct(int id) async {
    final product = await getProductById(id);
    productName.text = product?.productName ?? '';
    productDescription.text = product?.productDescription ?? '';
    productValue.text = product?.productValue.toString() ?? '';

    return true;
  }

  Future<bool> initScreen() async {
    cleanController();
    return true;
  }

  Future<void> modifyProduct(int id) async {
    await updateProduct(
      productName.text,
      productDescription.text,
      double.parse(productValue.text),
      id,
    );
  }

  void submitForm() async {
    try {
      await insertProduct(
        productName.text,
        productDescription.text,
        double.parse(productValue.text),
        1,
      );

      NotificationHelper.show(
        title: 'Éxito',
        message: 'El producto se ha guardado correctamente',
        isError: false,
      );

      cleanController();
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: '$e',
        isError: true,
      );
    }
  }
}
