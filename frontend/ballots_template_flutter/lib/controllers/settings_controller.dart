import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/models/store_model.dart';

class SettingsController extends GetxController {
  final box = GetStorage();

  var name = TextEditingController();
  var phone = TextEditingController();
  var direction = TextEditingController();
  var email = TextEditingController();
  var ruc = TextEditingController();
  var nameOfFirm = TextEditingController();
  var positionOfFirm = TextEditingController();
  var signature = Rx<Uint8List?>(null);

  @override
  void onInit() async {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final Store? store = await getStore();

      name.text = store?.nameStore ?? '';
      phone.text = store?.phoneStore ?? '';
      direction.text = store?.addressStore ?? '';
      email.text = store?.emailStore ?? '';
      ruc.text = store?.rucStore ?? '';
      nameOfFirm.text = store?.signerName ?? '';
      positionOfFirm.text = store?.signerRole ?? '';
      signature.value = store?.signature;
    } catch (error) {
      NotificationHelper.show(
        title: 'Error',
        message: '$error',
        isError: true,
      );
    }
  }

  validateName(String value) {
    if (value.isEmpty) {
      return 'El nombre es requerido';
    }
    return null;
  }

  validatePhone(String value) {
    final cleanedValue = value.replaceAll(RegExp(r'\s+'), '');
    if (cleanedValue.isEmpty) return 'El número de teléfono es requerido';
    if (cleanedValue.length != 9) {
      return 'El número de teléfono debe tener 9 dígitos';
    }
    return null;
  }

  validateDirection(String value) {
    if (value.isEmpty) {
      return 'La dirección es requerida';
    }
    return null;
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return 'El correo electrónico es requerido';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Introduce un correo electrónico válido';
    }

    return null;
  }

  validateRuc(String value) {
    if (value.isEmpty) return 'La RUC es requerida';
    if (value.length < 8 || value.length > 11) {
      return 'El RUC debe tener entre 8 y 11 caracteres';
    }
    return null;
  }

  validateNameOfFirm(String value) {
    if (value.isEmpty) {
      return 'Nombre del firmante es obligatorio';
    }
    return null;
  }

  validatePositionOfFirm(String value) {
    if (value.isEmpty) {
      return 'Rol del firmante es obligatorio';
    }
    return null;
  }

  void updateSignature(Uint8List value) {
    signature.value = value;
  }

  void submitForm() async {
    try {
      final store = await getStore();
      if (store == null) {
        await insertStore(
          name.text,
          email.text,
          phone.text,
          direction.text,
          ruc.text,
          nameOfFirm.text,
          positionOfFirm.text,
          signature.value!,
        );
      } else {
        await updateStore(
          name.text,
          email.text,
          phone.text,
          direction.text,
          ruc.text,
          nameOfFirm.text,
          positionOfFirm.text,
          signature.value!,
        );
      }

      NotificationHelper.show(
        title: 'Éxito',
        message: 'El establecimiento se ha guardado correctamente',
        isError: false,
      );
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: 'Recuerda también agregar la firma',
        isError: true,
      );
    }
  }
}
