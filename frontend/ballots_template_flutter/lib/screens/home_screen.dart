import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/controllers/list_controller.dart';
import 'package:ballots_template_flutter/screens/form_register_screens.dart';
import 'package:ballots_template_flutter/widgets/bottom_sheet.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:ballots_template_flutter/widgets/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(ListController());
    Get.put(FormController());
  }

  void navigateToAnotherScreen(action) {
    final FormController formController = Get.find();

    if (formController.isFormValid) {
      print("entre Valid");
      action();
    } else {
      print("entre No Valid");
      Get.defaultDialog(
        title: '',
        titleStyle: GoogleFonts.onest(
          fontSize: 1,
        ),
        content: WarningDialog(
          title: '¡Aplicación no configurada!',
          titleBtn: "Ir a configurar",
          onPress: () {
            Get.back();
            Get.to(() => const FormRegisterScreen());
          },  
        ),
      );
    }
  }

  void showBottomSheet(BuildContext context) {
    final ListController controller = Get.find();
    print("Controller: ${controller.runtimeType}");

    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(
        title: 'Añadir atajo',
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ListController controller = Get.find();
    return ScreenContainer(
      backgroundColor: Colors.white,
      appBarChildren: const Text(
        "Generador de Recibo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      appBarActions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Icon(Icons.info_outline),
        )
      ],
      children: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: ListTile(
                onTap: () {},
                title: const Text(
                  'Opciones',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      icon: Icons.print_disabled,
                      backgroundColor: Colors.red,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    CustomButton(
                      icon: Icons.format_list_bulleted_add,
                      backgroundColor: const Color(0xFFCCCCCC),
                      color: Colors.black,
                      onPressed: () {
                        showBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                final listTileData = controller.getSelectedItems();
                return ListView.separated(
                  itemCount: listTileData.length,
                  itemBuilder: (context, index) {
                    final item = listTileData[index];
                    return GestureDetector(
                      onTap: () {
                        navigateToAnotherScreen(item['onTap']);
                      },
                      child: ListTile(
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                        ),
                        tileColor: const Color(0xFFE0E0E0),
                        title: Text(
                          item['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          item['subtitle'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        leading: Icon(item['icon']),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    this.onPressed,
  });
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
      ),
      color: color,
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
