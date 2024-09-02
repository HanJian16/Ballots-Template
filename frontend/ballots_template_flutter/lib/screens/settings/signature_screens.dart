import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:ballots_template_flutter/db/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/custom_btn.dart';

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
    _requestPermissions();
    _signatureController.addListener(
      () => setState(() {}),
    );
  }

  Future<void> _requestPermissions() async {
    // Solicita permisos para almacenamiento
    final statusStorage = await Permission.manageExternalStorage.request();

    if (statusStorage.isPermanentlyDenied) {
      Get.defaultDialog(
        title: "Permisos necesarios",
        content: const PermissionRequest(),
        backgroundColor: AppColors.cardColorSecondary,
      );
    } else if (!statusStorage.isGranted) {
      Get.snackbar(
        "Permiso necesario",
        "Necesitamos permisos para guardar imágenes.",
        duration: const Duration(seconds: 3),
      );
    }
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
                // ElevatedButton(
                //   onPressed: () => _signatureController.clear(),
                //   child: const Text('Limpiar'),
                // ),
                // ElevatedButton(
                //   onPressed: _saveSignature,
                //   child: const Text('Guardar'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveSignature() async {
    final statusManageExternalStorage =
        await Permission.manageExternalStorage.status;

    if (!statusManageExternalStorage.isGranted) {
      Get.snackbar(
        "Permisos no concedidos",
        "No tienes los permisos necesarios para guardar la firma.",
        duration: const Duration(seconds: 3),
      );
      return;
    }

    if (_signatureController.isNotEmpty) {
      try {
        final ui.Image? image = await _signatureController.toImage();

        if (image != null) {
          final ByteData? byteData =
              await image.toByteData(format: ui.ImageByteFormat.png);

          if (byteData != null) {
            final Uint8List pngBytes = byteData.buffer.asUint8List();
            await insertSignature(1, pngBytes);

            Get.back();
            Get.snackbar("Firma", "Firma guardada en la base de datos");
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
