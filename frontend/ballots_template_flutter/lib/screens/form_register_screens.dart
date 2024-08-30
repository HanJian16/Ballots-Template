import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/screens/company_logo_upload_screens.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/utils/bottom_sheet.dart';
import 'package:ballots_template_flutter/utils/formfield_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/screens/signature_screens.dart';
import 'package:ballots_template_flutter/widgets/custom_btn.dart';
import 'package:ballots_template_flutter/widgets/custom_textformfield.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:ballots_template_flutter/widgets/appbar_title_with_icon.dart';
import 'package:ballots_template_flutter/widgets/backup_row.dart';

class FormRegisterScreen extends StatefulWidget {
  const FormRegisterScreen({super.key});

  @override
  State<FormRegisterScreen> createState() => _FormRegisterScreenState();
}

class _FormRegisterScreenState extends State<FormRegisterScreen> {
  List formFieldSettings = [];
  late final FormController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(FormController());
    formFieldSettings = createDataForTextFormField(controller);
    controller.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    controller.onClose();
  }

  void _showBottomSheet(BuildContext context) {
    showCustomBottomSheet(
      context: context,
      content: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        color: AppColors.whiteColor,
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
    // final FormController controller = Get.put(FormController());

    return ScreenContainer(
      appBarChildren: AppBarTitleWithIcon(
        text: "Ajustes",
        icon: Icons.cloud_upload_sharp,
        onPressed: () => _showBottomSheet(context),
      ),
      children: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomBtn(
                      text: 'Añadir logotipo',
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
                    ...formFieldSettings.map(
                      (field) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: CustomTextFormField(
                                initialValue: field['initialValue'],
                                placeHolder: field['placeHolder'],
                                onChanged: field['onChanged'],
                                keyboardType: field['keyboardType'],
                                error: field['error'],
                                maxLength: field['maxLength'],
                              ),
                            ),
                           
                          ],
                        );
                      },
                    ),
                    Column(
                      children: [
                        CustomBtn(
                          text: 'Firmar',
                          customHeight: 50,
                          onPressed: () async {
                            await Get.to(() => const SignatureScreen());
                            // Después de volver de SignatureScreen, actualizar el estado
                            controller.updateSignaturePath();
                          },
                          status: 0,
                        ),
                        const SizedBox(height: 20),
                        CustomBtn(
                          text: 'Guardar',
                          customHeight: 50,
                          onPressed: () async {
                            controller.submitForm();
                            Get.toNamed(AppRoutes.home);
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
