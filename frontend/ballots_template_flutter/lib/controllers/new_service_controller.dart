import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class NewServiceController extends GetxController {
  final serviceDescription = TextEditingController();
  final serviceValue = TextEditingController();

  validateServiceDescription() {
    if (serviceDescription.text.isEmpty) {
      return 'Debe ingresar una descripción';
    }
    return null;
  }

  validateServiceValue() {
    if (serviceValue.text.isEmpty) {
      return 'Debe ingresar un valor';
    } else if (!RegExp(r'^\d*\.?\d+$').hasMatch(serviceValue.text)) {
      return 'El valor del producto debe ser un número';
    }
    return null;
  }

  void cleanController() {
    serviceDescription.text = '';
    serviceValue.text = '';
  }

  void onSubmit() async {
    try {
      await insertService(
        serviceDescription.text,
        double.parse(serviceValue.text),
        1,
      );

      NotificationHelper.show(
        title: 'Éxito',
        message: 'El servicio se ha guardado correctamente',
        isError: false,
      );

      cleanController();

      Get.toNamed(AppRoutes.home);
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: e.toString(),
        isError: true,
      );
    }
  }
}
