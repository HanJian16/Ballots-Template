import 'package:ballots_template_flutter/theme/index.dart';
import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/widgets/index.dart';

class CompanyLogoUploadScreen extends StatefulWidget {
  const CompanyLogoUploadScreen({super.key});

  @override
  State<CompanyLogoUploadScreen> createState() =>
      _CompanyLogoUploadScreenState();
}

class _CompanyLogoUploadScreenState extends State<CompanyLogoUploadScreen> {
  @override
  void initState() {
    super.initState();
  }

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

  Future<void> uploadLogo() async {
    // var status = await Permission.photos.request();
    // var storageStatus = await Permission.storage.request();
    // print("Storage status: $storageStatus");
    // if (storageStatus == PermissionStatus.granted) {
    //  print("Storage granted");
    // } else {
    //    showDialog(
    //     context: Get.context!,
    //     builder: (BuildContext context) => AlertDialog(
    //       title: const Text('Permiso requerido'),
    //       content: const Text('Necesitamos acceso al almacenamiento para seleccionar una imagen.'),
    //       actions: [
    //         TextButton(
    //           child: const Text('Cancelar'),
    //           onPressed: () => Navigator.of(context).pop(),
    //         ),
    //         TextButton(
    //           child: const Text('Ir a ajustes'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //             openAppSettings();
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(title: 'Seleccionar imagen',
      appBarActions: [
_buildAppBarActions([
  {
    'icon': Icons.search,
    'onPressed': () {
      uploadLogo();
    },
    'color': AppColors.blackColor,
  }
])
      ],
      // Column(
      //   children: [
      //     AppBarTitleWithIcon(
      //       text: "Seleccionar imagen",
      //       icon: Icons.search,
      //       onPressed: () => uploadLogo(),
      //     ),
      //   ],
      // ),
      children: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset("assets/gifs/upload-logo.gif"),
          ],
        ),
      ),
    );
  }
}
