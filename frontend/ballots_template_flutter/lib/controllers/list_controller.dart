import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class ListController extends GetxController {
  List<Client> listClients = <Client>[].obs;
  List<Product> listProducts = <Product>[].obs;
  List<Service> listServices = <Service>[].obs;
  List<HistoryProduct> listHistoryProduct = <HistoryProduct>[].obs;
  List<HistoryService> listHistoryService = <HistoryService>[].obs;
  var filteredList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getClientsDb();
  }

  void filterList(String query, String type) {
    if (query.isEmpty) {
      if (type == 'client') {
        filteredList.value = listClients;
      } else if (type == 'product') {
        filteredList.value = listProducts;
      } else if (type == 'service') {
        filteredList.value = listServices;
      } else if (type == 'history-product') {
        filteredList.value = listHistoryProduct;
      } else if (type == 'history-service') {
        filteredList.value = listHistoryService;
      }
    } else {
      if (type == 'client') {
        filteredList.value = listClients
            .where((client) =>
                client.name.toLowerCase().contains(query.toLowerCase()) ||
                client.phone.toLowerCase().contains(query.toLowerCase()) ||
                client.document.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else if (type == 'product') {
        filteredList.value = listProducts
            .where((product) =>
                product.productName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else if (type == 'service') {
        filteredList.value = listServices
            .where((service) =>
                service.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else if (type == 'history-product') {
        filteredList.value = listHistoryProduct
            .where((historyProduct) =>
                historyProduct.id.toString().contains(query))
            .toList();
      } else if (type == 'history-service') {
        filteredList.value = listHistoryService
            .where((historyService) =>
                historyService.id.toString().contains(query))
            .toList();
      }
    }
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

  Future<List<HistoryProduct>> getHistoryProductsDb() async {
    final historyProductDB = await getHistoryProducts();
    listHistoryProduct.assignAll(historyProductDB);
    return listHistoryProduct;
  }

  Future<List<HistoryService>> getHistoryServicesDb() async {
    final historyServiceDB = await getHistoryServices();
    listHistoryService.assignAll(historyServiceDB);
    return listHistoryService;
  }

  Future<void> onTapReubication(item, String type) async {
    if (type == 'client') {
      Get.toNamed(
        AppRoutes.editClient,
        arguments: item.id,
      );
    } else if (type == 'product') {
      Get.toNamed(
        AppRoutes.editProduct,
        arguments: item.id,
      );
    } else if (type == 'service') {
      Get.toNamed(
        AppRoutes.editService,
        arguments: item.id,
      );
    } else if (type == 'history-product') {
      Get.toNamed(
        AppRoutes.productInvoice,
        arguments: item.id,
      );
    } else if (type == 'history-service') {
      Get.toNamed(
        AppRoutes.serviceInvoice,
        arguments: item.id,
      );
    }
  }

  Future<void> onTapSelect(item, String type) async {
    final invoiceController = Get.find<InvoiceController>();

    if (type == 'client') {
      final data = item as Client;

      Get.bottomSheet(Card(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person_search_rounded),
                title: const Text('Seleccionar cliente'),
                onTap: () async {
                  try {
                    final clientController = Get.find<ClientController>();
                    final actualClient =
                        await clientController.getClient(data.id);
                    invoiceController.selectClient(actualClient!);
                    Get.back();
                    Get.back();
                  } catch (e) {
                    NotificationHelper.show(
                      title: 'Error',
                      message: '$e',
                      isError: true,
                    );
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Detalles del cliente'),
                onTap: () {
                  Get.toNamed(
                    AppRoutes.editClient,
                    arguments: data.id,
                  );
                },
              ),
            ],
          ),
        ),
      ));
    } else if (type == 'product') {
      Get.back();
      createDialogForAddProductOrService(type, item);
    } else if (type == 'service') {
      Get.back();
      createDialogForAddProductOrService(type, item);
    }
  }
}

void createDialogForAddProductOrService(String type, item) {
  final editingController = TextEditingController(text: '1.0');

  Get.defaultDialog(
    title: 'Cantidad',
    content: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (double.parse(editingController.text) > 0) {
                editingController.text =
                    '${double.parse(editingController.text) - 1}';
              }
            },
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: editingController,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              editingController.text =
                  '${double.parse(editingController.text) + 1}';
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    ),
    confirm: CustomBtn(
      onPressed: () {
        final invoiceController = Get.find<InvoiceController>();
        if (type == 'product') {
          final data = item as Product;
          final dataMap = {
            'name': data.productName,
            'amount': double.parse(editingController.text),
            'value': data.productValue,
            'total': data.productValue * double.parse(editingController.text),
          };
          invoiceController.addProduct(dataMap);
        } else if (type == 'service') {
          final data = item as Service;
          final dataMap = {
            'name': data.description,
            'amount': double.parse(editingController.text),
            'value': data.value,
            'total': data.value * double.parse(editingController.text),
          };
          invoiceController.addService(dataMap);
        }

        Get.back();
      },
      text: 'Confirmar',
      status: 1,
    ),
    cancel: CustomBtn(
      onPressed: () {
        Get.back();
      },
      text: 'Cancelar',
      status: 1,
      customColor: AppColors.errorColor,
    ),
  );
}
