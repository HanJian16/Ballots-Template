import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class RegisterProductScreen extends StatelessWidget {
  const RegisterProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewProductController controller = Get.put(NewProductController());
    final formKey = GlobalKey<FormState>();
    List formFieldSettings = [
      {
        'controller': controller.productName,
        'hintText': 'Nombre del producto',
        'suffixIcon': IconButton(
          onPressed: () {},
          icon: const Icon(Icons.clear),
        ),
        'validator': (value) => controller.validateProductName(value!),
      },
      {
        'controller': controller.productDescription,
        'hintText': 'Descripción',
        'validator': (value) => controller.validateProductDescription(value!),
      },
      {
        'controller': controller.productValue,
        'keyboardType': TextInputType.number,
        'hintText': 'Valor del producto',
        'validator': (value) => controller.validateProductValue(value!),
      },
    ];

    return ScreenContainer(
      appBarChildren: const Text('Registro del producto'),
      children: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ...formFieldSettings.map(
                (field) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: field['controller'],
                      decoration: InputDecoration(
                        hintText: field['hintText'],
                        suffixIcon: field['suffixIcon'],
                      ),
                      keyboardType: field['keyboardType'],
                      validator: (value) => field['validator'](value!),
                    ),
                  );
                },
              ),
              // TextFormField(
              //   controller: controller.productName,
              //   decoration: InputDecoration(
              //     hintText: 'Nombre del producto',
              //     suffixIcon: IconButton(
              //       onPressed: () {},
              //       icon: const Icon(Icons.clear),
              //     ),
              //   ),
              //   validator: (value) => controller.validateProductName(value!),
              // ),
              // const SizedBox(height: 20),
              // TextFormField(
              //   controller: controller.productDescription,
              //   decoration: const InputDecoration(hintText: 'Descripción'),
              //   validator: (value) =>
              //       controller.validateProductDescription(value!),
              // ),
              // const SizedBox(height: 20),
              // TextFormField(
              //   controller: controller.productValue,
              //   keyboardType: TextInputType.number,
              //   decoration:
              //       const InputDecoration(hintText: 'Valor del producto'),
              //   validator: (value) => controller.validateProductValue(value!),
              // ),
              // const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (validateAndSaveForm(formKey)) {
                    controller.submitForm();
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
