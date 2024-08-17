import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:ballots_template_flutter/controllers/form_controller.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  SignatureScreenState createState() => SignatureScreenState();
}

class SignatureScreenState extends State<SignatureScreen> {
  final SignatureController _signatureController = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 5,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    // Solicita permisos para almacenamiento y cámara
    final statusStorage = await Permission.storage.request();

    if (!statusStorage.isGranted) {
      Get.snackbar(
        "Permisos necesarios",
        "Necesitamos permisos para guardar imágenes y usar la cámara.",
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
              backgroundColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _signatureController.clear(),
                  child: const Text('Limpiar'),
                ),
                ElevatedButton(
                  onPressed: _saveSignature,
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveSignature() async {
    if (_signatureController.isNotEmpty) {
      try {
        final ui.Image? image = await _signatureController.toImage();

        if (image != null) {
          final ByteData? byteData =
              await image.toByteData(format: ui.ImageByteFormat.png);

          if (byteData != null) {
            final Uint8List pngBytes = byteData.buffer.asUint8List();
            final directory = await getApplicationDocumentsDirectory();
            final imagePath = '${directory.path}/signature.png';

            final file = File(imagePath);
            if (await file.exists()) {
              await file.delete();
            }

            await file.writeAsBytes(pngBytes, flush: true);

            Get.snackbar("Firma", "Firma guardada como imagen");

            final FormController controller = Get.find();
            controller.signaturePath.value = imagePath;

            // Verificar si el widget sigue montado antes de usar 'context'
            if (mounted) {
              Navigator.pop(context);
            }
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
