import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BluetoohScreen extends StatelessWidget {
  const BluetoohScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenshotController = Get.find<ScreenshotControllerGetx>();
    screenshotController.getBoolConnect();
    return ScreenContainer(
      title: 'Impresora térmica',
      appBarActions: [
        IconButton(
          onPressed: () {
            screenshotController.getBoolConnect();
          },
          icon: const Icon(Icons.refresh),
        ),
      ],
      children: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () {
            List items = screenshotController.devices;
            final idDevice = screenshotController.idDevice.value;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: idDevice != null && idDevice == index
                      ? const Icon(Icons.check)
                      : const Icon(Icons.print),
                  title: Text(items[index].name),
                  onTap: () {
                    if (screenshotController.isConnected.value == true) {
                      screenshotController.disconnect();
                    } else {
                      screenshotController.connect(items[index], index);
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TestPrint {
  String formatDate(DateTime dateTime) {
    // Define el formato que deseas: día/mes/año hora:minuto
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(dateTime);
  }

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  final settingsController = Get.find<SettingsController>();
  final invoiceController = Get.find<InvoiceController>();

  sample() async {
    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.printCustom(
          '${settingsController.name.value.text}',
          Size.extraLarge.val,
          Align.center.val,
        );
        bluetooth.printNewLine();
        bluetooth.printLeftRight(
          'RUC: ${settingsController.ruc.value.text}',
          'Tel: ${settingsController.phone.value.text}',
          Size.medium.val,
        );
        bluetooth.printLeftRight(
          'Direccion: ${settingsController.direction.value.text}',
          'Correo: ${settingsController.email.value.text}',
          Size.medium.val,
        );
        bluetooth.printNewLine();
        bluetooth.printCustom(
          '----------------------------------------------',
          1,
          Align.center.val,
        );
        bluetooth.printNewLine();
        bluetooth.printCustom('N 0', Size.bold.val, Align.left.val);
        bluetooth.printCustom(
          'Cliente: ${invoiceController.client.value?.name}',
          Size.medium.val,
          Align.left.val,
        );
        bluetooth.printCustom(
          'Documento: ${invoiceController.client.value?.document}',
          Size.medium.val,
          Align.left.val,
        );
        bluetooth.printCustom(
          'Telefono: ${invoiceController.client.value?.phone}',
          Size.medium.val,
          Align.left.val,
        );
        bluetooth.printCustom(
          'Direccion: ${invoiceController.client.value?.address}',
          Size.medium.val,
          Align.left.val,
        );
        bluetooth.printNewLine();
        bluetooth.printCustom(
          '----------------------------------------------',
          1,
          Align.center.val,
        );
        bluetooth.printNewLine();
        bluetooth.printCustom(
            'Productos', Size.boldMedium.val, Align.center.val);
        bluetooth.printNewLine();
        bluetooth.printCustom(
          'Total: ${invoiceController.total.value}',
          Size.medium.val,
          Align.right.val,
        );
        bluetooth.printCustom(
          'Descuento: ${invoiceController.descuento.value}',
          Size.medium.val,
          Align.right.val,
        );
        bluetooth.printCustom(
          'Total a pagar: ${invoiceController.totalPay.value}',
          Size.bold.val,
          Align.right.val,
        );
        bluetooth.printCustom(
          '----------------------------------------------',
          1,
          Align.center.val,
        );
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printCustom(
          '-------------------',
          1,
          Align.center.val,
        );
        bluetooth.printCustom(
          '${settingsController.nameOfFirm.value.text}',
          Size.medium.val,
          Align.center.val,
        );
        bluetooth.printCustom(
          '${settingsController.positionOfFirm.value.text}',
          Size.medium.val,
          Align.center.val,
        );
        bluetooth.printNewLine();
        bluetooth.printCustom(
          '${formatDate(DateTime.now())}',
          Size.medium.val,
          Align.right.val,
        );
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
      }
    });
  }
}

enum Size {
  medium, //normal size text
  bold, //only bold text
  boldMedium, //bold with medium
  boldLarge, //bold with large
  extraLarge //extra large
}

enum Align {
  left, //ESC_ALIGN_LEFT
  center, //ESC_ALIGN_CENTER
  right, //ESC_ALIGN_RIGHT
}

extension PrintSize on Size {
  int get val {
    switch (this) {
      case Size.medium:
        return 0;
      case Size.bold:
        return 1;
      case Size.boldMedium:
        return 2;
      case Size.boldLarge:
        return 3;
      case Size.extraLarge:
        return 4;
      default:
        return 0;
    }
  }
}

extension PrintAlign on Align {
  int get val {
    switch (this) {
      case Align.left:
        return 0;
      case Align.center:
        return 1;
      case Align.right:
        return 2;
      default:
        return 0;
    }
  }
}
