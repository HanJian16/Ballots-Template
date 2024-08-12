import 'package:get/get.dart';

class FormController extends GetxController {
  var name = ''.obs;
  var phone = ''.obs;
  var direction = ''.obs;
  var email = ''.obs;
  var ruc = ''.obs;
  var nameOfFirm = ''.obs;
  var positionOfFirm = ''.obs;

   void updateName(String value) => name.value = value;
  void updatePhone(String value) => phone.value = value;
  void updateDirection(String value) => direction.value = value;
  void updateEmail(String value) => email.value = value;
  void updateRuc(String value) => ruc.value = value;
  void updateNameOfFirm(String value) => nameOfFirm.value = value;
  void updatePositionOfFirm(String value) => positionOfFirm.value = value;

  void submitForm() {
    // Lógica para manejar el formulario
    print('Name: ${name.value}');
    print('Phone: ${phone.value}');
    print('Direction: ${direction.value}');
    print('Email: ${email.value}');
    print('RUC: ${ruc.value}');
    print('Name of firm: ${nameOfFirm.value}');
    print('Position of firm: ${positionOfFirm.value}');
    // Aquí puedes añadir más lógica, como enviar datos a un servidor.
  }
}
