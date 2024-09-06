import 'package:ballots_template_flutter/screens/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class ScreenshotControllerGetx extends GetxController {
  var isConnected = false.obs;
  var devices = [].obs;
  var idDevice = Rx<int?>(null);

  ScreenshotController screenshotController = ScreenshotController();
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  @override
  void onInit() {
    super.onInit();
    getBoolConnect();
  }

  void getBoolConnect() async {
    final data = await bluetooth.isConnected;

    devices.value = await bluetooth.getBondedDevices();

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          isConnected.value = true;
          print("bluetooth device state: connected");

          break;
        case BlueThermalPrinter.DISCONNECTED:
          isConnected.value = false;
          print("bluetooth device state: disconnected");

          break;
        case BlueThermalPrinter.DISCONNECT_REQUESTED:
          isConnected.value = false;
          print("bluetooth device state: disconnect requested");

          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          isConnected.value = false;
          print("bluetooth device state: bluetooth turning off");

          break;
        case BlueThermalPrinter.STATE_OFF:
          isConnected.value = false;
          print("bluetooth device state: bluetooth off");

          break;
        case BlueThermalPrinter.STATE_ON:
          isConnected.value = false;
          print("bluetooth device state: bluetooth on");

          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          isConnected.value = false;
          print("bluetooth device state: bluetooth turning on");

          break;
        case BlueThermalPrinter.ERROR:
          isConnected.value = false;
          print("bluetooth device state: error");

          break;
        default:
          print(state);
          break;
      }
      if (data == true) isConnected.value = true;
      print('isConnected: ${isConnected.value}');
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

  Future<void> printTicket() async {
    TestPrint testPrint = TestPrint();
    testPrint.sample();
  }
}
