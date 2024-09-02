import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listClients =
        Get.find<ListClientsController>().listClients as List<Client>;

    return ScreenContainer(
      title: 'Clientes',
      floatingActionButton:
          AddItemBtn(onPress: () => Get.toNamed(AppRoutes.addClient)),
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Buscar cliente'),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(listClients[index].name),
                      subtitle: Text(listClients[index].phone),
                      trailing: const Icon(Icons.arrow_right),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: listClients.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
