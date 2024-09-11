import 'package:ballots_template_flutter/models/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class ClientController extends GetxController {
  final name = TextEditingController();
  final phone = TextEditingController();
  final document = TextEditingController();
  final address = TextEditingController();
  final namePhone = ''.obs;
  final numberPhone = ''.obs;

  validationName(String value) {
    if (value.isEmpty) {
      return 'El nombre es requerido';
    }
    return null;
  }

  void updateNamePhone(String value) {
    name.text = value;
    namePhone.value = value;
  }

  void updateNumberPhone(String value) {
    phone.text = value;
    numberPhone.value = value;
  }

  validationPhone(String value) {
    final cleanedValue = value.replaceAll(RegExp(r'\D'), '');
    if (cleanedValue.isEmpty) return 'El número de teléfono es requerido';
    if (cleanedValue.length != 9) {
      return 'El número de teléfono debe tener 9 dígitos';
    }
    return null;
  }

  validationDocument(String value) {
    if (value.isEmpty) {
      return 'El documento es requerido';
    } else if (!RegExp(r'^\d*\.?\d+$').hasMatch(value)) {
      return 'El valor del producto debe ser un número';
    }
    return null;
  }

  validationAddress(String value) {
    if (value.isEmpty) {
      return 'La dirección es requerida';
    }
    return null;
  }

  void cleanController() {
    name.text = '';
    phone.text = '';
    document.text = '';
    address.text = '';
  }

  Future<Client?> getClient(int id) async {
    try {
      final client = await getClientById(id);

      return client!;
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: '$e',
        isError: true,
      );
      return null;
    }
  }

  Future<bool> updateClientFromDb(int id) async {
    final client = await getClientById(id);
    name.text = client?.name ?? '';
    phone.text = client?.phone ?? '';
    document.text = client?.document ?? '';
    address.text = client?.address ?? '';
    namePhone.value = client?.name ?? '';
    numberPhone.value = client?.phone ?? '';

    return true;
  }

  Future<bool> addScreen() async {
    cleanController();
    return true;
  }

  Future modifyClient(int id) async {
    await updateClient(
      name.text,
      phone.text,
      document.text,
      address.text,
      id,
    );
  }

  void onSubmit({bool? addFromPhone}) async {
    try {
      if (addFromPhone == true) {
        await insertClient(
          namePhone.value,
          numberPhone.value,
          document.text,
          address.text,
          1,
        );
      } else {
        await insertClient(
          name.text,
          phone.text,
          document.text,
          address.text,
          1,
        );
      }

      NotificationHelper.show(
        title: 'Éxito',
        message: 'El cliente se ha guardado correctamente',
        isError: false,
      );

      namePhone.value = '';
      numberPhone.value = '';

      cleanController();

      ListController controller = Get.find();
      controller.getClientsDb();
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: '$e',
        isError: true,
      );
    }
  }
}
