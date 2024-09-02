import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class RegisterServiceScreen extends StatelessWidget {
  const RegisterServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewServiceController());
    final formKey = GlobalKey<FormState>();

    return ScreenContainer(
      title: 'Registro de servicio',
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.serviceDescription,
                decoration: const InputDecoration(hintText: 'Descripción'),
                validator: (value) => controller.validateServiceDescription(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.serviceValue,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: 'Valor del servicio'),
                validator: (value) => controller.validateServiceValue(),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (validateAndSaveForm(formKey)) {
                    controller.onSubmit();
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
