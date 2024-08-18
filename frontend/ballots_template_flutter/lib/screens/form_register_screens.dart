import 'package:ballots_template_flutter/screens/company_logo_upload_screens.dart';
import 'package:ballots_template_flutter/utils/bottom_sheet.dart';
import 'package:ballots_template_flutter/utils/formfield_settings.dart';
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
    showCustomBottomSheet(
      context: context,
      content: Container(
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
      ),
      heightPercentage: 0.12,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FormController controller = Get.put(FormController());
    final List formFieldSettings = createDataForTextFormField(controller);

    return ScreenContainer(
      // backgroundColor: Colors.white,
      appBarChildren: CustomIconButton(
        text: "Ajustes",
        icon: Icons.cloud_upload_sharp,
        onPressed: () => _showBottomSheet(context),
      ),
      children: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              height: 1.5,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomBtn(
                      text: 'Añadir logotipo',
                      // customColor: Colors.teal.shade400,
                      onPressed: () {
                        Get.to(() => const CompanyLogoUploadScreen());
                      },
                      status: 1,
                    ),
                    const SizedBox(height: 20),
                    // Muestra la firma si está disponible
                    // Obx(() {
                    //   final signaturePath = controller.signaturePath.value;
                    //   return Container(
                    //     alignment: Alignment.center,
                    //     height: 300,
                    //     width: double.infinity,
                    //     color: Colors.red,
                    //     child: signaturePath.isNotEmpty
                    //         ? Image.file(File(signaturePath))
                    //         : const Text('No hay firma, añade una.'),
                    //   );
                    // }),
                    const SizedBox(height: 20),
                    // Lista de campos de formulario
                    ...formFieldSettings.map(
                      (field) => Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: CustomTextFormField(
                          customBackgroundColor: field['customBackgroundColor'],
                          placeHolder: field['placeHolder'],
                          onChanged: field['onChanged'],
                          keyboardType: field['keyboardType'],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CustomBtn(
                          text: 'Firmar',
                          customHeight: 50,
                          // customColor: Colors.teal.shade400,
                          onPressed: () async {
                            await Get.to(() => const SignatureScreen());
                            // Después de volver de SignatureScreen, actualizar el estado
                            controller.updateSignaturePath();
                          },
                          status: 0,
                        ),
                        const SizedBox(height: 10),
                        CustomBtn(
                          text: 'Guardar',
                          customHeight: 50,
                          // customColor: Colors.teal.shade400,
                          onPressed: () {
                            controller.submitForm();
                          },
                          status: 1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
