import 'package:ballots_template_flutter/models/index.dart';
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
}
