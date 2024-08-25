import 'package:ballots_template_flutter/network/api/api_client.dart';
import 'package:ballots_template_flutter/widgets/notification_helper.dart';
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
  var signaturePath = ''.obs;

  @override
  void onClose() {
    // Limpiar los datos cuando la pantalla se destruye
    name.value = '';
    phone.value = '';
    direction.value = '';
    email.value = '';
    ruc.value = '';
    nameOfFirm.value = '';
    positionOfFirm.value = '';
    signaturePath.value = '';
    super.onClose();
  }

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
        positionOfFirm.isNotEmpty;
    // && signaturePath.isNotEmpty; // Verificar si hay firma
  }

  void submitForm() async {
    if (isFormValid) {
      final ApiClient apiClient = ApiClient();
      final storeData = {
        'nameStore': name.value,
        'phoneStore': phone.value,
        'addressStore': direction.value,
        'emailStore': email.value,
        'rucStore': ruc.value,
        'signerName': nameOfFirm.value,
        'signerRole': positionOfFirm.value,
        // 'logo': signaturePath.value,
      };

      try {
        final response = await apiClient.postSore(storeData);

        if (response.statusCode == 201) {
          NotificationHelper.show(
            title: 'Éxito',
            message: 'El establecimiento se ha guardado correctamente',
            isError: false,
          );
        } else {
          NotificationHelper.show(
            title: 'Error',
            message: 'No se pudo enviar el establecimiento',
            isError: true,
          );
        }
      } catch (e) {
        NotificationHelper.show(
          title: 'Error',
          message: 'No se puedo guardar el establecimiento',
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
