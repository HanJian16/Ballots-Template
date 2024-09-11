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
      children: Obx(() {
        if (contactController.contacts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: contactController.contacts.length,
            itemBuilder: (context, index) {
              final contact = contactController.contacts[index];
              return Card(
                margin: const EdgeInsets.all(20),
                child: ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.phone != ''
                      ? contact.phone
                      : 'Sin número'),
                  onTap: () {
                    if(contact.phone != '') {
                    contactController.selectContact(contact);
                    Get.toNamed(AppRoutes.addClient, arguments: true);
                    } else {
                      NotificationHelper.show(
                        title: 'Error',
                        message: 'El contacto no puede ser registrado sin número',
                        isError: true,
                      );
                    }
                  },
                  trailing: const Icon(Icons.arrow_right),
                ),
              );
            }
          );
        }
      }),
    );
  }
}
