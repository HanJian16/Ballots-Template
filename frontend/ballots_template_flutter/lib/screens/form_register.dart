import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/widgets/custom_btn.dart';
import 'package:ballots_template_flutter/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/widgets/custom_icon_btn.dart';
import 'package:ballots_template_flutter/widgets/backup_row.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

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
    // ignore: no_leading_underscores_for_local_identifiers
    final _formKey = GlobalKey<FormState>();

    return ScreenContainer(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              Column(
                children: [
                  CustomTextFormField(
                    customBackgroundColor: const Color(0xFFE0E0E0),
                    placeHolder: 'Nombre del establecimiento',
                    onChanged: (value) => controller.updateName(value),
                  ),
                  CustomTextFormField(
                    customBackgroundColor: const Color(0xFFE0E0E0),
                    placeHolder: 'Indica tu teléfono',
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => controller.updatePhone(value),
                  ),
                  CustomTextFormField(
                    customBackgroundColor: const Color(0xFFE0E0E0),
                    placeHolder: 'Introduce tu dirección',
                    onChanged: (value) => controller.updateDirection(value),
                  ),
                  CustomTextFormField(
                    customBackgroundColor: const Color(0xFFE0E0E0),
                    placeHolder: 'Escriba su correo electrónico',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => controller.updateEmail(value),
                  ),
                  CustomTextFormField(
                    customBackgroundColor: const Color(0xFFE0E0E0),
                    placeHolder: 'Número de Identificación de la empresa',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => controller.updateRuc(value),
                  ),
                  CustomTextFormField(
                    customBackgroundColor: const Color(0xFFE0E0E0),
                    placeHolder: 'Nombre de quien firmará',
                    onChanged: (value) => controller.updateNameOfFirm(value),
                  ),
                  CustomTextFormField(
                    customBackgroundColor: const Color(0xFFE0E0E0),
                    placeHolder: 'Cargo de la persona que firma',
                    onChanged: (value) => controller.updatePositionOfFirm(value),
                  ),
                ],
              ),
              const SizedBox(height: 20),

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
      ),
    );
  }
}
