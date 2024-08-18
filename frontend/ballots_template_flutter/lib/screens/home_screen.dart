import 'package:ballots_template_flutter/screens/form_register_screens.dart';
import 'package:ballots_template_flutter/utils/homescreen_datalist.dart';
import 'package:ballots_template_flutter/widgets/custom_btn.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showBottomSheet(BuildContext context) {
    List listTileData = getListTileData();
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.95,
        // padding: const EdgeInsets.all(10),
        // color: Colors.white,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20)), // Ajusta el radio aquí
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              // color: Colors.grey[350],
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.grey[350],
              ),
              child: Text(
                'Añadir atajo',
                style: GoogleFonts.onest(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listTileData.length,
                itemBuilder: (context, index) {
                  final item = listTileData[index];
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['title'],
                            style: GoogleFonts.onest(
                              fontSize: 15,
                            )),
                        Checkbox(
                          value: item['selected'],
                          onChanged: (bool? value) {
                            item['selected'] = value;
                          },
                        )
                      ],
                    ),
                  );

                  // return Obx(() {
                  //   return ListTile(
                  //     title: Text(item['title']),
                  //     trailing: Checkbox(
                  //       value: controller.selectedItems[item['title']] ?? false,
                  //       onChanged: (bool? value) {
                  //         controller.toggleSelection(item['title']);
                  //       },
                  //     ),
                  //     onTap: () {
                  //       controller.toggleSelection(item['title']);
                  //     },
                  //   );
                  // });
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: CustomBtn(
                  text: 'Confirmar',
                  status: 1,
                  customFontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List listTileData = getListTileData();

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
              child: ListView.separated(
                itemCount: listTileData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                    ),
                    // tileColor: const Color(0xFFCCCCCC),
                    tileColor: const Color(0xFFE0E0E0),
                    title: Text(
                      listTileData[index]['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      listTileData[index]['subtitle'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    leading: Icon(listTileData[index]['icon']),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(const FormRegisterScreen()),
              child: const SizedBox(
                // height: 32,
                // width: 32,
                child: Text("FormRegistro"),
              ),
            )
          ],
        ),
      ),
    );
    // Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     elevation: 0,
    //     bottomOpacity: 0,
    //     scrolledUnderElevation: 0,
    //     automaticallyImplyLeading: false,
    //     // toolbarOpacity: 0,
    //     backgroundColor: Colors.white,

    //     title: const Text(
    //       "Generador de Recibo",
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     actions: const [
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 30),
    //         child: Icon(Icons.info_outline),
    //       )
    //     ],
    //   ),
    //   body: Container(
    //     // padding: const EdgeInsets.symmetric(horizontal: 10),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Container(
    //           decoration: const BoxDecoration(color: Colors.white),
    //           child: ListTile(
    //             onTap: () {},
    //             title: const Text(
    //               'Opciones',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 18,
    //               ),
    //             ),
    //             trailing: const Row(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 CustomButton(
    //                   icon: Icons.print_disabled,
    //                   backgroundColor: Colors.red,
    //                   color: Colors.white,
    //                 ),
    //                 CustomButton(
    //                   icon: Icons.format_list_bulleted_add,
    //                   backgroundColor: Color(0xFFCCCCCC),
    //                   color: Colors.black,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Expanded(
    //           child: ListView.separated(
    //             itemCount: listTileData.length,
    //             itemBuilder: (context, index) {
    //               return ListTile(
    //                 shape: const BeveledRectangleBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
    //                   side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
    //                 ),
    //                 tileColor: const Color(0xFFCCCCCC),
    //                 title: Text(
    //                   listTileData[index]['title'],
    //                   style: const TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //                 subtitle: Text(
    //                   listTileData[index]['subtitle'],
    //                   style: const TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //                 leading: Icon(listTileData[index]['icon']),
    //                 trailing: const Icon(Icons.arrow_forward_ios),
    //               );
    //             },
    //             separatorBuilder: (context, index) {
    //               return const SizedBox(height: 10);
    //             },
    //           ),
    //         ),
    //         GestureDetector(
    //           onTap: () => Get.to(const FormRegisterScreen()),
    //           child: const SizedBox(
    //             height: 32,
    //             width: 32,
    //             child: Text("hola"),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
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
