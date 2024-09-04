import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/models/index.dart';

class ListController extends GetxController {
  List<Client> listClients = <Client>[].obs;
  List<Product> listProducts = <Product>[].obs;
  List<Service> listServices = <Service>[].obs;

  @override
  void onInit() {
    super.onInit();
    getClientsDb();
  }

  Future<List<Client>> getClientsDb() async {
    final clientsDB = await getClients();
    listClients.assignAll(clientsDB);
    return listClients;
  }

  Future<List<Product>> getProductsDb() async {
    final productsDB = await getProducts();
    listProducts.assignAll(productsDB);
    return listProducts;
  }

  Future<List<Service>> getServicesDb() async {
    final servicesDB = await getServices();
    listServices.assignAll(servicesDB);
    return listServices;
  }

  Future<void> onTapReubicacion(item, String type) async {
    if (type == 'client') {
      Get.toNamed(
        AppRoutes.editClient,
        arguments: item.id,
      );
    } else if (type == 'product') {
      Get.toNamed(
        AppRoutes.editproduct,
        arguments: item.id,
      );
    } else if (type == 'service') {
      Get.toNamed(
        AppRoutes.editservice,
        arguments: item.id,
      );
    }
  }

  Future<void> onTapSelect(item, String type) async {
    if (type == 'client') {
      // final data = item as Client;
    } else if (type == 'product') {
      final data = item as Product;
      Get.back();
      Get.defaultDialog(
        title: 'Cantidad',
        middleText: data.productDescription,
      );
    } else if (type == 'service') {
      // final data = item as Service;
    }
  }
}
