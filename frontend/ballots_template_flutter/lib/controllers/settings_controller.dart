import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class SettingsController extends GetxController {
  final box = GetStorage();

  var name = TextEditingController();
  var phone = TextEditingController();
  var direction = TextEditingController();
  var email = TextEditingController();
  var ruc = TextEditingController();
  var nameOfFirm = TextEditingController();
  var positionOfFirm = TextEditingController();
  var signaturePath = ''.obs;

  var nameError = ''.obs;
  var phoneError = ''.obs;
  var directionError = ''.obs;
  var emailError = ''.obs;
  var rucError = ''.obs;
  var nameOfFirmError = ''.obs;
  var positionOfFirmError = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    _loadData();
    // signaturePath.value = box.read('signaturePath') ?? '';
  }

  Future<void> _loadData() async {
    try {
      final dynamic store = await box.read('storeData');
      if (store != null) {
        name.text = store['nameStore'] ?? '';
        phone.text = store['phoneStore'] ?? '';
        direction.text = store['addressStore'] ?? '';
        email.text = store['emailStore'] ?? '';
        ruc.text = store['rucStore'] ?? '';
        nameOfFirm.text = store['signerName'] ?? '';
        positionOfFirm.text = store['signerRole'] ?? '';
      } else {
        name.text = '';
        phone.text = '';
        direction.text = '';
        email.text = '';
        ruc.text = '';
        nameOfFirm.text = '';
        positionOfFirm.text = '';
      }
    } catch (error) {
      NotificationHelper.show(
        title: 'Error',
        message: '$error',
        isError: true,
      );
    }
  }

  void updateSignaturePath() async {
    // Actualiza la ruta de la firma si existe
    final directory = await getApplicationDocumentsDirectory();
    final signatureFilePath = '${directory.path}/signature.png';
    signaturePath.value = signatureFilePath;
  }

  bool get isFormValid {
    return nameError.isEmpty &&
        phoneError.isEmpty &&
        directionError.isEmpty &&
        emailError.isEmpty &&
        rucError.isEmpty &&
        nameOfFirmError.isEmpty &&
        positionOfFirmError.isEmpty &&
        name.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        direction.text.isNotEmpty &&
        email.text.isNotEmpty &&
        ruc.text.isNotEmpty &&
        nameOfFirm.text.isNotEmpty &&
        positionOfFirm.text.isNotEmpty;
    // // && signaturePath.isNotEmpty; // Verificar si hay firma
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

  void submitForm() async {
    if (isFormValid) {
      try {
        final formData = {
          'nameStore': name.text,
          'phoneStore': phone.text,
          'addressStore': direction.text,
          'emailStore': email.text,
          'rucStore': ruc.text,
          'signerName': nameOfFirm.text,
          'signerRole': positionOfFirm.text,
          // 'signaturePath': signaturePath.value,
        };
        await box.write('storeData', formData);

        final store = await getStore();
        if (store.isEmpty) {
          await insertStore(
            name.text,
            email.text,
            phone.text,
            direction.text,
            ruc.text,
            nameOfFirm.text,
            positionOfFirm.text,
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
          message: '$e',
          isError: true,
        );
      }
    } else {
      NotificationHelper.show(
        title: 'Error',
        message: 'Por favor, complete todos los campos',
        isError: true,
      );
    }
  }
}
