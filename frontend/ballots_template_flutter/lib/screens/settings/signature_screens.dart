import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  SignatureScreenState createState() => SignatureScreenState();
}

class SignatureScreenState extends State<SignatureScreen> {
  final SignatureController _signatureController = SignatureController(
    penColor: AppColors.blackColor,
    penStrokeWidth: 5,
    exportBackgroundColor: AppColors.transparentColor,
  );

  @override
  void initState() {
    super.initState();
    _signatureController.addListener(
      () => setState(() {}),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firma'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveSignature,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Signature(
              controller: _signatureController,
              height: double.infinity,
              backgroundColor: AppColors.whiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomBtn(
                    text: 'Limpiar',
                    onPressed: () => _signatureController.clear(),
                    status: 1,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomBtn(
                    text: 'Guardar',
                    onPressed: _saveSignature,
                    status: _signatureController.isEmpty ? 0 : 1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveSignature() async {
    // final statusManageExternalStorage =
    //     await Permission.manageExternalStorage.status;

    // if (!statusManageExternalStorage.isGranted) {
    //   Get.snackbar(
    //     "Permisos no concedidos",
    //     "No tienes los permisos necesarios para guardar la firma.",
    //     duration: const Duration(seconds: 3),
    //   );
    //   return;
    // }

    if (_signatureController.isNotEmpty) {
      try {
        final ui.Image? image = await _signatureController.toImage();

        if (image != null) {
          final ByteData? byteData =
              await image.toByteData(format: ui.ImageByteFormat.png);

          if (byteData != null) {
            final Uint8List pngBytes = byteData.buffer.asUint8List();
            final controller = Get.find<SettingsController>();
            controller.updateSignature(pngBytes);

            Get.back();
            NotificationHelper.show(
              title: 'Éxito',
              message: 'La firma ha sido registrada',
              isError: false,
            );
          } else {
            Get.snackbar("Firma", "Error al convertir la firma a imagen");
          }
        } else {
          Get.snackbar("Firma", "Error al capturar la imagen de la firma");
        }
      } catch (e) {
        Get.snackbar("Firma", "Error al guardar la firma a imagen");
      }
    } else {
      Get.snackbar("Firma", "No hay firma para guardar");
    }
  }
}

class PermissionRequest extends StatelessWidget {
  const PermissionRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Necesitamos permisos para guardar imágenes y gestionar almacenamiento.',
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomBtn(
          text: 'Abrir configuración',
          onPressed: () {
            openAppSettings();
            Get.back();
          },
          status: 1,
        ),
      ],
    );
  }
}
