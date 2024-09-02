import 'package:ballots_template_flutter/utils/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddClientController>();
    final formKey = GlobalKey<FormState>();

    return ScreenContainer(
      title: 'Agregar cliente',
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
              CustomBtn(
                text: 'Agregar',
                status: 1,
                onPressed: () {
                  if (validateAndSaveForm(formKey)) {
                    controller.onSubmit();
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
