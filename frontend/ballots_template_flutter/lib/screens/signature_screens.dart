import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final SignatureController _signatureController = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 5,
    exportBackgroundColor: Colors.transparent,
  );

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
              height: 300,
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
        // Convert the signature to an image
        final ui.Image? image = await _signatureController.toImage();
        
        if (image != null) {
          final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

          if (byteData != null) {
            final Uint8List pngBytes = byteData.buffer.asUint8List();

            // Get the directory to save the image
            final directory = await getApplicationDocumentsDirectory();
            final imagePath = '${directory.path}/signature.png';

            // Save the image
            final file = File(imagePath);
            await file.writeAsBytes(pngBytes);

            // Optionally, save to gallery
            final result = await ImageGallerySaver.saveImage(pngBytes);
            print('Image saved to gallery: $result');

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Firma guardada como imagen')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error al convertir la firma a imagen')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al capturar la imagen de la firma')),
          );
        }
      } catch (e) {
        print('Error al guardar la firma: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar la firma')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No hay firma para guardar')),
      );
    }
  }
}
