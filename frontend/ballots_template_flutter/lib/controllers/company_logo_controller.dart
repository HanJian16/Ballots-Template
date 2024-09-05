import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CompanyLogoController extends GetxController {
  var selectedLogo = Rxn<File>();
  final ImagePicker _picker = ImagePicker();
  Future<void> selectImage() async {
    var status = await Permission.photos.request();

    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedLogo.value =
            File(pickedFile.path); // Actualiza la imagen seleccionada
      }
    } else {
      // Manejar el caso en que el permiso es denegado
      Get.snackbar('Error', 'Permiso para acceder a la galería denegado.');
    }
  }
}
