import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';

class ScreenshotControllerGetx extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> captureWidget() async {
    var statusBluetoothConnect = await Permission.bluetoothConnect.request();
    var statusBluetoothScan = await Permission.bluetoothScan.request();
    var statusBluetoothAdvertise =
        await Permission.bluetoothAdvertise.request();

    if (statusBluetoothAdvertise.isGranted &&
        statusBluetoothScan.isGranted &&
        statusBluetoothConnect.isGranted) {
      final image = await screenshotController.capture();
      if (image != null) {
        final pdf = pw.Document();
        final pdfImage = pw.MemoryImage(
          image, // La imagen capturada (_Uint8ArrayView)
        );
        pdf.addPage(
          pw.Page(
            // pageFormat: PdfPageFormat.a4, // Tamaño A4 para la página
            build: (pw.Context context) {
              return pw.Image(
                pdfImage,
                fit: pw.BoxFit.contain,
                // width: PdfPageFormat.a4.width, // Ancho de la página A4
                // height: PdfPageFormat.a4.height, // Alto de la página A4
              ); // Colocar la imagen en el PDF a tamaño completo
            },
          ),
        );

        // final output = await getTemporaryDirectory();
        // final file = File("${output.path}/example.pdf");
        // await file.writeAsBytes(await pdf.save());
        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save(),
        );
      } else {
      }
    } else {
    }
  }
}
