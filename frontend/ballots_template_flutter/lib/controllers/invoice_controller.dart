import 'dart:convert';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  RxList listProducts = [].obs;
  RxList listServices = [].obs;
  Rx<double> total = 0.0.obs;
  Rx<double> totalPay = 0.0.obs;
  Rx<double> descuento = 0.0.obs;
  final client = Rx<Client?>(null);
  final invoiceId = 0.obs;
  final checkbox = true.obs;
  final boolObservations = false.obs;
  final observations = ''.obs;
  String type = '';
  final date = ''.obs;

  @override
  void onInit() {
    super.onInit();
    ever(listProducts, (_) {
      total.value = 0;
      for (var element in listProducts) {
        total.value += element['total'];
      }
    });
    ever(listServices, (_) {
      total.value = 0;
      for (var element in listServices) {
        total.value += element['total'];
      }
    });
    ever(total, (_) {
      totalPay.value = total.value - descuento.value;
    });
    ever(descuento, (_) {
      totalPay.value = total.value - descuento.value;
    });
  }

  void addProduct(Map<String, dynamic> product) {
    listProducts.add(product);
  }

  void addService(Map<String, dynamic> service) {
    listServices.add(service);
  }

  void removeProductList(int id) {
    listProducts.removeAt(id);
  }

  void removeServiceList(int id) {
    listServices.removeAt(id);
  }

  void selectClient(Client client) {
    this.client.value = client;
  }

  void deleteAll() {
    listProducts.value = [];
    listServices.value = [];
    total.value = 0.0;
    totalPay.value = 0.0;
    descuento.value = 0.0;
    client.value = null;
    invoiceId.value = 0;
    checkbox.value = true;
    boolObservations.value = false;
    observations.value = '';
  }

  bool createHistoryProduct() {
    try {
      if (client.value == null) {
        NotificationHelper.show(
          title: 'Error',
          message: 'El cliente no puede ser nulo',
          isError: true,
        );
        return false;
      }

      if (listProducts.isEmpty) {
        NotificationHelper.show(
          title: 'Error',
          message: 'El historial de productos no puede estar vacío',
          isError: true,
        );
        return false;
      }

      final productListJson = jsonEncode(listProducts);
      insertHistoryProduct(
        1,
        productListJson,
        client.value!.id,
        total.value,
        descuento.value,
        totalPay.value,
        observations.value,
        date.value,
      );

      return true;
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: 'Problemas al guardar el historial de productos',
        isError: true,
      );
      return false;
    }
  }

  bool createHistoryService() {
    try {
      if (client.value == null) {
        NotificationHelper.show(
          title: 'Error',
          message: 'El cliente no puede ser nulo',
          isError: true,
        );
        return false;
      }

      if (listServices.isEmpty) {
        NotificationHelper.show(
          title: 'Error',
          message: 'El historial de servicios no puede estar vacío',
          isError: true,
        );
        return false;
      }

      final serviceListJson = jsonEncode(listServices);
      insertHistoryService(
        1,
        serviceListJson,
        client.value!.id,
        total.value,
        descuento.value,
        totalPay.value,
        observations.value,
        date.value,
      );

      return true;
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: 'Problemas al guardar el historial de servicios',
        isError: true,
      );
      return false;
    }
  }
}
