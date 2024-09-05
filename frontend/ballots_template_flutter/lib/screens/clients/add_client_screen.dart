import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientController>();
    final listClientsController = Get.find<ListController>();
    final formKey = GlobalKey<FormState>();
    final id = Get.arguments;

    return FutureBuilder(
      future: type == 'add'
          ? controller.addScreen()
          : controller.updateClientFromDb(id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ScreenContainer(
            children: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return ScreenContainer(
          title: type == 'add' ? 'Agregar cliente' : 'Editar cliente',
          children: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    decoration:
                        const InputDecoration(hintText: 'Nombre del cliente'),
                    validator: (value) => controller.validationName(value!),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.phone,
                    decoration: const InputDecoration(
                      hintText: 'Teléfono',
                      counterText: '',
                    ),
                    keyboardType: TextInputType.phone,
                    maxLength: 12,
                    validator: (value) => controller.validationPhone(value!),
                    inputFormatters: [
                      PhoneNumberFormatter(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.document,
                    decoration: const InputDecoration(
                      hintText: 'Documento',
                      counterText: '',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    validator: (value) => controller.validationDocument(value!),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.address,
                    decoration: const InputDecoration(hintText: 'Dirección'),
                    validator: (value) => controller.validationAddress(value!),
                  ),
                  const SizedBox(height: 20),
                  if (type == 'add')
                    CustomBtn(
                      text: 'Agregar',
                      status: 1,
                      onPressed: () {
                        if (validateAndSaveForm(formKey)) {
                          controller.onSubmit();
                          listClientsController.getClientsDb();
                          Get.back();
                        }
                      },
                    ),
                  if (type == 'edit')
                    Row(
                      children: [
                        Expanded(
                          child: CustomBtn(
                            text: 'Borrar',
                            status: 1,
                            customColor: AppColors.errorColor,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomBtn(
                            text: 'Editar',
                            status: 1,
                            onPressed: () {
                              controller.modifyClient(id);
                              listClientsController.getClientsDb();
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
