// import 'package:ballots_template_flutter/network/api/api_client.dart';
import 'package:ballots_template_flutter/widgets/notification_helper.dart';
// import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

class FormController extends GetxController {
  final box = GetStorage();

  var name = ''.obs;
  var phone = ''.obs;
  var direction = ''.obs;
  var email = ''.obs;
  var ruc = ''.obs;
  var nameOfFirm = ''.obs;
  var positionOfFirm = ''.obs;
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
        name.value = store['nameStore'] ?? '';
        phone.value = store['phoneStore'] ?? '';
        direction.value = store['addressStore'] ?? '';
        email.value = store['emailStore'] ?? '';
        ruc.value = store['rucStore'] ?? '';
        nameOfFirm.value = store['signerName'] ?? '';
        positionOfFirm.value = store['signerRole'] ?? '';
      } else {
        name.value = '';
        phone.value = '';
        direction.value = '';
        email.value = '';
        ruc.value = '';
        nameOfFirm.value = '';
        positionOfFirm.value = '';
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void updateName(String value) {
    name.value = value;
    nameError.value = _validateName(value);
  }

  void updatePhone(String value) {
    phone.value = value;
    phoneError.value = _validatePhone(value);
  }

  void updateDirection(String value) {
    direction.value = value;
    directionError.value = _validateDirection(value);
  }

  void updateEmail(String value) {
    email.value = value;
    emailError.value = _validateEmail(value);
  }

  void updateRuc(String value) {
    ruc.value = value;
    rucError.value = _validateRuc(value);
  }

  void updateNameOfFirm(String value) {
    nameOfFirm.value = value;
    nameOfFirmError.value = _validateNameOfFirm(value);
  }

  void updatePositionOfFirm(String value) {
    positionOfFirm.value = value;
    positionOfFirmError.value = _validatePositionOfFirm(value);
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
        name.value.isNotEmpty &&
        phone.value.isNotEmpty &&
        direction.value.isNotEmpty &&
        email.value.isNotEmpty &&
        ruc.value.isNotEmpty &&
        nameOfFirm.value.isNotEmpty &&
        positionOfFirm.value.isNotEmpty;
    // // && signaturePath.isNotEmpty; // Verificar si hay firma
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return 'El nombre es requerido';
    }
    return '';
  }

  String _validatePhone(String value) {
    final cleanedValue = value.replaceAll(RegExp(r'\s+'), '');
    if (cleanedValue.isEmpty) return 'El número de teléfono es requerido';
    if (cleanedValue.length != 9) {
      return 'El número de teléfono debe tener 9 dígitos';
    }
    return '';
  }

  String _validateDirection(String value) {
    if (value.isEmpty) {
      return 'La dirección es requerida';
    }
    return '';
  }

  String _validateEmail(String value) {
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

    return '';
  }

  String _validateRuc(String value) {
    if (value.isEmpty) return 'La RUC es requerida';
    if (value.length < 8 || value.length > 11) {
      return 'El RUC debe tener entre 8 y 11 caracteres';
    }
    return '';
  }

  String _validateNameOfFirm(String value) {
    if (value.isEmpty) {
      return 'Nombre del firmante es obligatorio';
    }
    return '';
  }

  String _validatePositionOfFirm(String value) {
    if (value.isEmpty) {
      return 'Rol del firmante es obligatorio';
    }
    return '';
  }

  void submitForm() async {
    if (isFormValid) {
      try {
        final formData = {
          'nameStore': name.value,
          'phoneStore': phone.value,
          'addressStore': direction.value,
          'emailStore': email.value,
          'rucStore': ruc.value,
          'signerName': nameOfFirm.value,
          'signerRole': positionOfFirm.value,
          // 'signaturePath': signaturePath.value,
        };
        await box.write('storeData', formData);
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
