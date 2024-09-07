import 'dart:convert';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class InvoiceController extends GetxController {
  RxList listProducts = [].obs;
  RxList listServices = [].obs;
  Rx<double> total = 0.0.obs;
  Rx<double> totalPay = 0.0.obs;
  Rx<double> descuento = 0.0.obs;
  final client = Rx<Client?>(null);
  final invoiceProductId = 0.obs;
  final invoiceServiceId = 0.obs;
  final checkbox = true.obs;
  final boolObservations = false.obs;
  final observations = ''.obs;
  String type = '';
  final date = ''.obs;
  final discountType = ''.obs;

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
      if (checkbox.value == true) {
        // totalPay.value = total.value - descuento.value;
      } else {}
    });
  }

  void updateDiscountTypeFromBD(value, id, category) async {
    dynamic prueba;
    if (category == 'product') {
      prueba = await getHistoryProductById(id);
    } else if (category == 'service') {
      prueba = await getHistoryServiceById(id);
    }
    if (prueba != null) {
      discountType.value = prueba.discountType;
    } else {
      if (value == true) {
        discountType.value = 'Cantidad';
      } else {
        discountType.value = 'Porcentaje';
      }
    }
  }

  void calculateDiscount() {
    if (checkbox.value == true) {
      totalPay.value = total.value - descuento.value;
      discountType.value = 'Cantidad';
    } else {
      totalPay.value = total.value - (total.value * descuento.value / 100);
      discountType.value = 'Porcentaje';
    }
  }

  void updateDate(value) {
    date.value = value;
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

  void deleteAll() async {
    listProducts.value = [];
    listServices.value = [];
    total.value = 0.0;
    totalPay.value = 0.0;
    descuento.value = 0.0;
    client.value = null;
    checkbox.value = true;
    boolObservations.value = false;
    observations.value = '';
    discountType.value = '';

    final historyProductDB = await getHistoryProducts();
    final historyServiceDB = await getHistoryServices();

    invoiceProductId.value = historyProductDB.length + 1;
    invoiceServiceId.value = historyServiceDB.length + 1;
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
      checkbox.value = true;
      insertHistoryProduct(
        1,
        productListJson,
        client.value!.id,
        total.value,
        descuento.value,
        totalPay.value,
        observations.value,
        date.value,
        discountType.value,
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
        discountType.value,
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

  void fillController(int id, String type) async {
    try {
      if (type == 'product') {
        final product = await getHistoryProductById(id);
        if (product != null) {
          updateDate(product.date);
          final clientValue = await getClientById(product.clientId);
          if (clientValue != null) {
            final dataList = jsonDecode(product.productList);

            listProducts.assignAll(dataList);
            client.value = clientValue;
            total.value = product.total;
            descuento.value = product.descuento;
            totalPay.value = product.totalPay;
            observations.value = product.observations;
            date.value = product.date;
            invoiceProductId.value = product.id;

            if (product.observations != '') {
              boolObservations.value = false;
            } else {
              boolObservations.value = true;
            }
          }
        }
      } else if (type == 'service') {
        final service = await getHistoryServiceById(id);
        if (service != null) {
          updateDate(service.date);
          final clientValue = await getClientById(service.clientId);
          if (clientValue != null) {
            final dataList = jsonDecode(service.serviceList);
            listServices.assignAll(dataList);
            client.value = clientValue;
            total.value = service.total;
            descuento.value = service.descuento;
            totalPay.value = service.totalPay;
            observations.value = service.observations;
            date.value = service.date;
            invoiceServiceId.value = service.id;

            if (service.observations != '') {
              boolObservations.value = false;
            } else {
              boolObservations.value = true;
            }
          }
        }
      }
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: 'Problemas al cargar el historial de este producto',
        isError: true,
      );
    }
  }
}
