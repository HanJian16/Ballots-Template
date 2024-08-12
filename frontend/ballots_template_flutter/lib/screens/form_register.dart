import 'package:ballots_template_flutter/data/formfield_settings.dart';
import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/screens/signature_screens.dart';
import 'package:ballots_template_flutter/widgets/custom_btn.dart';
import 'package:ballots_template_flutter/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:get/get.dart';
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

    final List formFieldSettings = createDataForTextFormField(controller);

    return ScreenContainer(
      child: Form(
        key: formKey,
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
            CustomBtn(
              text: 'Añadir logotipo',
              customWidth: 110,
              customColor: Colors.teal.shade400,
              onPressed: () => print('Logo'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: formFieldSettings.length,
                itemBuilder: (context, index) {
                  return CustomTextFormField(
                    customBackgroundColor: formFieldSettings[index]
                        ['customBackgroundColor'],
                    placeHolder: formFieldSettings[index]['placeHolder'],
                    onChanged: formFieldSettings[index]['onChanged'],
                    keyboardType: formFieldSettings[index]['keyboardType'],
                  );
                },
              ),
            ),
            // const SizedBox(height: 20),
            CustomBtn(
              text: 'Firmar',
              customWidth: double.infinity,
              customHeight: 50,
              customColor: Colors.teal.shade400,
              onPressed: () => Get.to(const SignatureScreen()),
            ),
            SizedBox(
              height: 10,
            ),
            CustomBtn(
              text: 'Guardar',
              customWidth: double.infinity,
              customHeight: 50,
              customColor: Colors.teal.shade400,
              onPressed: () => controller.submitForm(),
            ),
          ],
        ),
      ),
    );
  }
}
