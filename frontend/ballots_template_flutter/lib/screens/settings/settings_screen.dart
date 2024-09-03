import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/screens/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Uint8List? signature;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextTheme theme = Theme.of(context).textTheme;
    List formFieldSettings = createDataForTextFormField();
    late final SettingsController controller = Get.find<SettingsController>();

    Widget buildAppBarActions(List<Map<String, dynamic>> icons) {
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          children: icons.map((iconData) {
            return IconButton(
              icon: Icon(
                iconData['icon'] as IconData,
                color: iconData['color'] ?? AppColors.whiteColor,
              ),
              onPressed: iconData['onPressed'] as VoidCallback?,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    iconData['background'] ?? AppColors.greyColor),
              ),
            );
          }).toList(),
        ),
      );
    }

    return ScreenContainer(
      title: 'Ajustes',
      appBarActions: [
        buildAppBarActions([
          {
            'icon': Icons.cloud_upload_sharp,
            'onPressed': () {
              showCustomBottomSheet(
                context: context,
                content: const BackupOptions(),
                heightPercentage: 0.12,
              );
            },
            'color': AppColors.blackColor,
          }
        ])
      ],
      children: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                ...formFieldSettings.map(
                  (field) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: field['controller'],
                        decoration: InputDecoration(
                            hintText: field['placeHolder'], counterText: ''),
                        keyboardType: field['keyboardType'],
                        maxLength: field['maxLength'],
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
                Obx(() {
                  return Container(
                  height: 250,
                  color: AppColors.cardColorSecondary,
                  child: controller.signature.value != null
                      ? Image.memory(controller.signature.value!)
                      : Center(
                          child: Text(
                            'Agrega una firma',
                            style: theme.titleLarge,
                          ),
                        ),
                );
                }),
                const SizedBox(
                  height: 5,
                ),
                CustomBtn(
                  text: 'Firmar',
                  onPressed: () async {
                    await Get.toNamed(AppRoutes.signatureSettings);
                    // Después de volver de SignatureScreen, actualizar el estado
                    // controller.updateSignaturePath();
                  },
                  status: 1,
                ),
                const SizedBox(height: 20),
                CustomBtn(
                  text: 'Guardar',
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
      ),
    );
  }
}
