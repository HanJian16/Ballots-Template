import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FormController extends GetxController {
  var name = ''.obs;
  var phone = ''.obs;
  var direction = ''.obs;
  var email = ''.obs;
  var ruc = ''.obs;
  var nameOfFirm = ''.obs;
  var positionOfFirm = ''.obs;
  var signaturePath = ''.obs; // Ruta de la firma guardada

  void updateName(String value) => name.value = value;
  void updatePhone(String value) => phone.value = value;
  void updateDirection(String value) => direction.value = value;
  void updateEmail(String value) => email.value = value;
  void updateRuc(String value) => ruc.value = value;
  void updateNameOfFirm(String value) => nameOfFirm.value = value;
  void updatePositionOfFirm(String value) => positionOfFirm.value = value;

  void updateSignaturePath() async {
    // Actualiza la ruta de la firma si existe
    final directory = await getApplicationDocumentsDirectory();
    final signatureFilePath = '${directory.path}/signature.png';
    signaturePath.value = signatureFilePath;
  }

  bool get isFormValid {
    return name.isNotEmpty &&
        phone.isNotEmpty &&
        direction.isNotEmpty &&
        email.isNotEmpty &&
        ruc.isNotEmpty &&
        nameOfFirm.isNotEmpty &&
        positionOfFirm.isNotEmpty &&
        signaturePath.isNotEmpty; // Verificar si hay firma
  }

  void submitForm() {
    if (isFormValid) {
      print('Form is valid. Submitting...');
      // Lógica para manejar el formulario
      print('Name: ${name.value}');
      print('Phone: ${phone.value}');
      print('Direction: ${direction.value}');
      print('Email: ${email.value}');
      print('RUC: ${ruc.value}');
      print('Name of firm: ${nameOfFirm.value}');
      print('Position of firm: ${positionOfFirm.value}');
      print('Signature path: ${signaturePath.value}');
      // Aquí puedes añadir más lógica, como enviar datos a un servidor.
    } else {
      Get.snackbar(
        'Error',
        'Por favor, complete todos los campos y añada una firma',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        duration: Duration(seconds: 3),
      );
    }
  }
}
