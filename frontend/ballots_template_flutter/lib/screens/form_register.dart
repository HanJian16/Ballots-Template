import 'dart:io';
import 'package:ballots_template_flutter/data/formfield_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/screens/signature_screens.dart';
import 'package:ballots_template_flutter/widgets/custom_btn.dart';
import 'package:ballots_template_flutter/widgets/custom_textformfield.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:ballots_template_flutter/widgets/custom_icon_btn.dart';
import 'package:ballots_template_flutter/widgets/backup_row.dart';

class FormRegisterScreen extends StatelessWidget {
  const FormRegisterScreen({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.12,
          color: Colors.white,
          child: const Column(
            children: [
              BackupRow(
                text: "Realizar copia de seguridad",
                icon: Icons.cloud_upload,
              ),
              BackupRow(
                text: "Restaurar copia de seguridad",
                icon: Icons.cloud_upload_outlined,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final FormController controller = Get.put(FormController());
    final formKey = GlobalKey<FormState>();

    // final List formFieldSettings = createDataForTextFormField(controller);
    final List formFieldSettings = createDataForTextFormField(controller);

    return ScreenContainer(
      child: Column(
        children: [
          CustomIconButton(
            text: "Ajustes",
            icon: Icons.cloud_upload_sharp,
            onPressed: () => _showBottomSheet(context),
          ),
          const SizedBox(height: 15),
          Container(
            height: 2,
            color: Colors.black,
          ),
          const SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomBtn(
                    text: 'Añadir logotipo',
                    customWidth: 110,
                    customColor: Colors.teal.shade400,
                    onPressed: () => print('Logo'),
                    status: 0,
                  ),
                  const SizedBox(height: 20),
                  // Muestra la firma si está disponible
                  Obx(() {
                    final signaturePath = controller.signaturePath.value;
                    print(signaturePath);
                    return Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: double.infinity,
                      color: Colors.red,
                      child: signaturePath.isNotEmpty
                          ? Image.file(File(signaturePath))
                          : const Text('No hay firma, añade una.'),
                    );
                  }),
                  const SizedBox(height: 20),
                  // Lista de campos de formulario
                  ...formFieldSettings
                      .map((field) => Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: CustomTextFormField(
                              customBackgroundColor:
                                  field['customBackgroundColor'],
                              placeHolder: field['placeHolder'],
                              onChanged: field['onChanged'],
                              keyboardType: field['keyboardType'],
                            ),
                          ))
                      .toList(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomBtn(
                          text: 'Firmar',
                          customWidth: double.infinity,
                          customHeight: 50,
                          customColor: Colors.teal.shade400,
                          onPressed: () async {
                            await Get.to(() => const SignatureScreen());
                            // Después de volver de SignatureScreen, actualizar el estado
                            controller.updateSignaturePath();
                          },
                          status: 1,
                        ),
                        SizedBox(height: 10),
                        CustomBtn(
                          text: 'Guardar',
                          customWidth: double.infinity,
                          customHeight: 50,
                          customColor: Colors.teal.shade400,
                          onPressed: () {
                            controller.submitForm();
                          },
                          status: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
