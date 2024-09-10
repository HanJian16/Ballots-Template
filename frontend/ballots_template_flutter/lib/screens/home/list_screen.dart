import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:permission_handler/permission_handler.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key, required this.type, this.addInBallot = false});
  final String type;
  final bool addInBallot;

  @override
  Widget build(BuildContext context) {
    final ListController controller = Get.find<ListController>();

    return FutureBuilder(
      future: type == 'client'
          ? controller.getClientsDb()
          : type == 'product'
              ? controller.getProductsDb()
              : type == 'history-product'
                  ? controller.getHistoryProductsDb()
                  : type == 'history-service'
                      ? controller.getHistoryServicesDb()
                      : controller.getServicesDb(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if (type == 'client') {
          controller.filteredList.value = controller.listClients;
        } else if (type == 'product') {
          controller.filteredList.value = controller.listProducts;
        } else if (type == 'service') {
          controller.filteredList.value = controller.listServices;
        } else if (type == 'history-product') {
          controller.filteredList.value = controller.listHistoryProduct;
        } else if (type == 'history-service') {
          controller.filteredList.value = controller.listHistoryService;
        }

        return ScreenContainer(
          title: type == 'client'
              ? 'Clientes'
              : type == 'product'
                  ? 'Lista de productos'
                  : type == 'history-product'
                      ? 'Historial de Productos'
                      : type == 'history-service'
                          ? 'Historial de Servicios'
                          : 'Lista de servicios',
          floatingActionButton:
              type == 'history-product' || type == 'history-service'
                  ? null
                  : AddItemBtn(
                      onPress: () {
                        if (type == 'client') {
                          Get.toNamed(AppRoutes.addClient);
                        } else if (type == 'product') {
                          Get.toNamed(AppRoutes.registerProduct);
                        } else if (type == 'service') {
                          Get.toNamed(AppRoutes.registerService);
                        }
                      },
                    ),
          children: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (query) {
                    controller.filterList(query, type);
                  },
                  decoration: InputDecoration(
                    hintText: type == 'client'
                        ? 'Buscar cliente'
                        : type == 'product'
                            ? 'Buscar producto'
                            : type == 'history-product'
                                ? 'Buscar boleta de productos'
                                : type == 'history-service'
                                    ? 'Buscar boleta de servicios'
                                    : 'Buscar servicio',
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final item = controller.filteredList[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              type == 'client'
                                  ? item.name
                                  : type == 'product'
                                      ? item.productName
                                      : type == 'history-product'
                                          ? item.date
                                          : type == 'history-service'
                                              ? item.date
                                              : item.description,
                            ),
                            subtitle: Text(type == 'client'
                                ? item.phone
                                : type == 'product'
                                    ? item.productValue.toString()
                                    : type == 'history-product'
                                        ? 'N° ${item.id} | Valor: ${item.totalPay.toString()}'
                                        : type == 'history-service'
                                            ? 'N° ${item.id} | Valor: ${item.totalPay.toString()}'
                                            : item.value.toString()),
                            trailing: const Icon(Icons.arrow_right),
                            onTap: () => addInBallot == true
                                ? controller.onTapSelect(item, type)
                                : controller.onTapReubication(item, type),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: controller.filteredList.length,
                    ),
                  ),
                ),
                if (type == 'client')
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: AddItemBtn(
                      title: 'Agregar\ncontactos',
                      onPress: () async {
                        var status = await Permission.contacts.request();
                        if(status.isGranted) {
                          // List<Contact> contacts = await FlutterContacts.getContacts();
                        }
                          Get.toNamed(AppRoutes.addClientFromPhone);
                      },
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
