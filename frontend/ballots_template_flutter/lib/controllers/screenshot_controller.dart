import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';

import 'package:ballots_template_flutter/screens/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class ScreenshotControllerGetx extends GetxController {
  var isConnected = false.obs;
  var devices = [].obs;
  var idDevice = Rx<int?>(null);

  ScreenshotController screenshotController = ScreenshotController();
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  final invoiceController = Get.find<InvoiceController>();

  @override
  void onInit() {
    super.onInit();
    getBoolConnect();
  }

  Future<bool> captureAndShare(int id, String category) async {
    bool isShared = false;
    try {
      final image = await screenshotController.capture();
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/boleta-$id.png';
        final imageFile = File(imagePath);
        await imageFile.writeAsBytes(image);
        final xFile =
            XFile(imagePath, mimeType: 'image/png', name: 'boleta-$id.png');
        final ShareResult response =
            await Share.shareXFiles([xFile], text: 'Aquí tienes la boleta.');

        if (response.status == ShareResultStatus.dismissed) {
          isShared = false;
        } else if (response.status == ShareResultStatus.success) {
          isShared = true;
        } else {
          isShared = false;
        }
      }
      return isShared;
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: 'Error al imprimir el boleto',
        isError: true,
      );
      return false;
    }
  }

  void verifyBluetooh() async {
    bool? isBluetoohOn = await bluetooth.isOn;

    if (isBluetoohOn != null && isBluetoohOn == false) {
      //? Si el bluietooh esta apagado pide permisos para encenderlo

      //* Primero verifica si el permiso para acceder a bluetooh esta habilitado
      PermissionStatus permissionStatus = await Permission.bluetooth.request();

      if (permissionStatus.isGranted) {
        //? Si el permiso esta habilitado se enciende el bluietooh
        await FlutterBluePlus.turnOn();
        getBoolConnect();
      } else if (permissionStatus.isDenied) {
        NotificationHelper.show(
          title: 'Error',
          message: 'Has denegado el acceso a Bluetooth',
          isError: true,
        );
      }
    }
  }

  void getBoolConnect() async {
    final data = await bluetooth.isConnected;

    devices.value = await bluetooth.getBondedDevices();

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          isConnected.value = true;

          break;
        case BlueThermalPrinter.DISCONNECTED:
          isConnected.value = false;

          break;
        case BlueThermalPrinter.DISCONNECT_REQUESTED:
          isConnected.value = false;

          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          isConnected.value = false;

          break;
        case BlueThermalPrinter.STATE_OFF:
          isConnected.value = false;

          break;
        case BlueThermalPrinter.STATE_ON:
          isConnected.value = false;

          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          isConnected.value = false;

          break;
        case BlueThermalPrinter.ERROR:
          isConnected.value = false;

          break;
        default:
          break;
      }
      if (data == true) isConnected.value = true;
    });
  }

  void connect(device, int index) {
    bluetooth.isConnected.then((isConnected) {
      if (isConnected == false) {
        final screenshotController = Get.find<ScreenshotControllerGetx>();
        bluetooth.connect(device).catchError((error) {
          screenshotController.isConnected.value = false;
          idDevice.value = null;
          NotificationHelper.show(
            title: 'Error',
            message: 'Hubo un error al conectar con la impresora térmica',
            isError: true,
          );
        });
        screenshotController.isConnected.value = true;
        idDevice.value = index;
        NotificationHelper.show(
          title: 'Conectado',
          message: 'Impresora térmica conectada',
          isError: false,
        );
      }
    });
  }

  void disconnect() {
    bluetooth.disconnect();
    isConnected.value = false;
    idDevice.value = null;

    NotificationHelper.show(
      title: 'Desconectado',
      message: 'Impresora térmica desconectada',
      isError: true,
    );
  }

  Future<bool> printTicket() async {
    try {
      TestPrint testPrint = TestPrint();
      testPrint.sample();

      return true;
    } catch (e) {
      return false;
    }
  }
}
