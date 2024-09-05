import 'package:ballots_template_flutter/models/index.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  RxList listProducts = [].obs;
  List listServices = [].obs;
  Rx<double> total = 0.0.obs;
  Rx<double> totalPay = 0.0.obs;
  Rx<double> descuento = 0.0.obs;
  final client = Rx<Client?>(null);
  final invoiceId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(listProducts, (_) {
      total.value = 0;
      listProducts.forEach((element) {
        total.value += element['total'];
      });
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
}
