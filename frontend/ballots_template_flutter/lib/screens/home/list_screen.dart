import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key, required this.type, this.addInballot = false});
  final String type;
  final bool addInballot;

  @override
  Widget build(BuildContext context) {
    final ListController controller = Get.find<ListController>();

    return FutureBuilder(
        future: type == 'client'
            ? controller.getClientsDb()
            : type == 'product'
                ? controller.getProductsDb()
                : controller.getServicesDb(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List list = [];

          if (type == 'client') {
            list = snapshot.data! as List<Client>;
          } else if (type == 'product') {
            list = snapshot.data! as List<Product>;
          } else if (type == 'service') {
            list = snapshot.data! as List<Service>;
          }

          return ScreenContainer(
            title: type == 'client'
                ? 'Clientes'
                : type == 'product'
                    ? 'Productos'
                    : 'Servicios',
            floatingActionButton: AddItemBtn(
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
                    decoration: InputDecoration(
                      hintText: type == 'client'
                          ? 'Buscar cliente'
                          : type == 'product'
                              ? 'Buscar producto'
                              : 'Buscar servicio',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final item = list[index];

                          return Card(
                            child: ListTile(
                              title: Text(
                                type == 'client'
                                    ? item.name
                                    : type == 'product'
                                        ? item.productName
                                        : item.description,
                              ),
                              subtitle: Text(type == 'client'
                                  ? item.phone
                                  : type == 'product'
                                      ? item.productValue.toString()
                                      : item.value.toString()),
                              trailing: const Icon(Icons.arrow_right),
                              onTap: () => addInballot == true
                                  ? controller.onTapSelect(item, type)
                                  : controller.onTapReubicacion(item, type),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: list.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
