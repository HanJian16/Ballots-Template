import 'package:ballots_template_flutter/screens/form_register.dart';
import 'package:ballots_template_flutter/utils/homescreen_datalist.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      children:  Container(
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
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        icon: Icons.print_disabled,
                        backgroundColor: Colors.red,
                        color: Colors.white,
                      ),
                      CustomButton(
                        icon: Icons.format_list_bulleted_add,
                        backgroundColor: Color(0xFFCCCCCC),
                        color: Colors.black,
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
                      tileColor: const Color(0xFFCCCCCC),
                      title: Text(
                        listTileData[index]['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        listTileData[index]['subtitle'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
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
                  height: 32,
                  width: 32,
                  child: Text("hola"),
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
  });
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
      ),
      color: color,
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}
