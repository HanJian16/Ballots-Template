import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class CompanyLogoUploadScreen extends StatelessWidget {
  CompanyLogoUploadScreen({super.key});
  final CompanyLogoController controller = Get.put(CompanyLogoController());

  Widget _buildAppBarActions(List<Map<String, dynamic>> icons) {
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

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
      title: 'Seleccionar imagen',
      appBarActions: [
        _buildAppBarActions([
          {
            'icon': Icons.search,
            'onPressed': () {
              controller.selectImage();
            },
            'color': AppColors.blackColor,
            'background': AppColors.cardColorSecondary,
          }
        ])
      ],
      children: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Obx(() {
              return controller.selectedLogo.value != null
                  ? ColorFiltered(
                      colorFilter: const ColorFilter.matrix(
                        <double>[
                          0.2126, 0.7152, 0.0722, 0, 0, // Red channel
                          0.2126, 0.7152, 0.0722, 0, 0, // Green channel
                          0.2126, 0.7152, 0.0722, 0, 0, // Blue channel
                          0, 0, 0, 1, 0,               // Alpha channel
                        ],
                      ),
                      child: Image.file(
                        controller.selectedLogo.value!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      "assets/gifs/upload-logo.gif",
                      width: 200,
                      height: 200,
                    );
            }),
            const SizedBox(height: 20),
            Obx(() {
              return Text(
                controller.selectedLogo.value != null
                    ? 'Imagen seleccionada'
                    : 'Seleccione una imagen para cargar',
                style: theme.headlineLarge,
              );
            }),
          ],
        ),
      ),
    );
  }
}
