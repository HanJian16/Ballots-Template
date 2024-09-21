import 'package:ballots_template_flutter/controllers/contact_controller.dart';
import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:get/get.dart';

class AddClientFromPhoneScreen extends StatelessWidget {
  const AddClientFromPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.find<ContactController>();
    return ScreenContainer(
      title: 'Agregar cliente desde teléfono',
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              onChanged: (query) {
                contactController.filterListContacts(query, 'phone');
              },
              decoration: const InputDecoration(
                hintText: 'Buscar contacto',
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (contactController.contacts.isEmpty) {
                contactController.filteredList.value =
                    contactController.contacts;
                return const Center(child: CircularProgressIndicator());
              } else {
                contactController.filteredList.value =
                    contactController.contacts;
                return Obx(
                  () => Expanded(
                    child: ListView.separated(
                      itemCount: contactController.filteredList.length,
                      itemBuilder: (context, index) {
                        final contact = contactController.filteredList[index];
                        return Card(
                          child: ListTile(
                            title: Text(contact.name),
                            subtitle: Text(contact.phone != ''
                                ? contact.phone
                                : 'Sin número'),
                            onTap: () {
                              if (contact.phone != '') {
                                contactController.selectContact(contact);
                                Get.toNamed(AppRoutes.addClient,
                                    arguments: true);
                              } else {
                                NotificationHelper.show(
                                  title: 'Error',
                                  message:
                                      'El contacto no puede ser registrado sin número',
                                  isError: true,
                                );
                              }
                            },
                            trailing: const Icon(Icons.arrow_right),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
