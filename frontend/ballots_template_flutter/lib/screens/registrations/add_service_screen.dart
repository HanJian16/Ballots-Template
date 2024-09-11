import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    final serviceController = Get.find<ServiceController>();
    final listController = Get.find<ListController>();
    final formKey = GlobalKey<FormState>();
    final id = Get.arguments;

    return FutureBuilder(
        future: type == 'register'
            ? serviceController.initScreen()
            : serviceController.getService(id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const ScreenContainer(
              children: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ScreenContainer(
            title:
                type == 'register' ? 'Registro de servicio' : 'Editar Servicio',
            children: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: serviceController.serviceDescription,
                      decoration:
                          const InputDecoration(hintText: 'Descripción'),
                      validator: (value) =>
                          serviceController.validateServiceDescription(),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: serviceController.serviceValue,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Valor del servicio'),
                      validator: (value) =>
                          serviceController.validateServiceValue(),
                    ),
                    const SizedBox(height: 20),
                    if (type == 'register')
                      TextButton(
                        onPressed: () {
                          if (validateAndSaveForm(formKey)) {
                            serviceController.onSubmit();
                            listController.getServicesDb();
                            Get.back();
                          }
                        },
                        child: const Text('Registrar'),
                      ),
                    if (type == 'edit')
                      Row(
                        children: [
                          Expanded(
                            child: CustomBtn(
                              text: 'Borrar',
                              customColor: AppColors.errorColor,
                              status: 1,
                              onPressed: () {
                                WarningDialogHelper.show(
                                  title: '¡Atento!',
                                  message:
                                      '¿Estás seguro de querer\nborrar este servicio?',
                                  confirmText: 'Borrar',
                                  cancelText: 'Cancelar',
                                  confirmOnPress: () async {
                                    await deleteService(id);
                                    listController.getServicesDb();
                                    Get.back();
                                    Get.back();
                                  },
                                  cancelOnPress: () {
                                    Get.back();
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomBtn(
                              text: 'Editar',
                              status: 1,
                              onPressed: () {
                                if (validateAndSaveForm(formKey)) {
                                  serviceController.modifyService(id);
                                  listController.getServicesDb();
                                  Get.back();
                                }
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
        });
  }
}
