import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/screens/company_logo_upload_screens.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/utils/bottom_sheet.dart';
import 'package:ballots_template_flutter/utils/formatters/phone_number_formatter.dart';
import 'package:ballots_template_flutter/utils/formfield_settings.dart';
import 'package:ballots_template_flutter/utils/validate_and_save_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/screens/signature_screens.dart';
import 'package:ballots_template_flutter/widgets/custom_btn.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:ballots_template_flutter/widgets/appbar_title_with_icon.dart';
import 'package:ballots_template_flutter/widgets/backup_row.dart';

class FormRegisterScreen extends StatelessWidget {
  const FormRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List formFieldSettings = createDataForTextFormField();
    late final FormController controller = Get.find<FormController>();
    final formKey = GlobalKey<FormState>();

    return ScreenContainer(
      appBarChildren: AppBarTitleWithIcon(
        text: "Ajustes",
        icon: Icons.cloud_upload_sharp,
        onPressed: () => showCustomBottomSheet(
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
        ),
      ),
      children: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 25),
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
              // const SizedBox(height: 20),
              ...formFieldSettings.map(
                (field) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: field['controller'],
                      decoration: InputDecoration(
                          hintText: field['placeHolder'], counterText: ''),
                      keyboardType: field['keyboardType'] ?? null,
                      maxLength: field['maxLength'] ?? null,
                      validator: (value) => field['validator'](value!),
                      inputFormatters: [
                        if (field['keyboardType'] != null &&
                            field['keyboardType'] == TextInputType.phone)
                          PhoneNumberFormatter(),
                      ],
                    ),
                  );
                },
              ),
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
                  if (validateAndSaveForm(formKey)) {
                    controller.submitForm();
                    Get.toNamed(AppRoutes.home);
                  }
                },
                status: 1,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
