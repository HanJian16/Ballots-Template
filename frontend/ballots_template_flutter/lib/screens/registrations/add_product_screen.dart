import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';
import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    final listController = Get.find<ListController>();
    final id = Get.arguments;
    final formKey = GlobalKey<FormState>();
    List formFieldSettings = [
      {
        'controller': productController.productName,
        'hintText': 'Nombre del producto',
        'validator': (value) => productController.validateProductName(value!),
      },
      {
        'controller': productController.productDescription,
        'hintText': 'Descripción',
        'validator': (value) =>
            productController.validateProductDescription(value!),
      },
      {
        'controller': productController.productValue,
        'keyboardType': TextInputType.number,
        'hintText': 'Valor del producto',
        'validator': (value) => productController.validateProductValue(value!),
      },
    ];

    return FutureBuilder(
      future: type == 'register'
          ? productController.initScreen()
          : productController.getProduct(id),
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
              type == 'register' ? 'Registro del producto' : 'Editar producto',
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
                          ),
                          keyboardType: field['keyboardType'],
                          validator: (value) => field['validator'](value!),
                        ),
                      );
                    },
                  ),
                  if (type == 'register')
                    TextButton(
                      onPressed: () {
                        if (validateAndSaveForm(formKey)) {
                          productController.submitForm();
                          listController.getProductsDb();
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
                            customColor: AppColors.errorColor,
                            onPressed: () {
                              WarningDialogHelper.show(
                                title: '¡Atento!',
                                message:
                                    '¿Estás seguro de querer\nborrar este producto?',
                                confirmText: 'Borrar',
                                cancelText: 'Cancelar',
                                confirmOnPress: () async {
                                  await deleteProduct(id);
                                  listController.getProductsDb();
                                  Get.back();
                                  Get.back();
                                },
                                cancelOnPress: () {
                                  Get.back();
                                },
                              );
                            },
                            text: 'Borrar',
                            status: 1,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              if (validateAndSaveForm(formKey)) {
                                productController.modifyProduct(id);
                                listController.getProductsDb();
                                Get.back();
                              }
                            },
                            child: const Text('Editar'),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
