import 'package:ballots_template_flutter/controllers/list_controller.dart';
// import 'package:ballots_template_flutter/widgets/custom_btn.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
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
  }

  void showBottomSheet(BuildContext context) {
    final ListController controller = Get.find();

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
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
              child: Obx(() {
                final listTileData = controller.listTileData;
                return ListView.builder(
                  itemCount: listTileData.length,
                  itemBuilder: (context, index) {
                    final item = listTileData[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['title'],
                            style: GoogleFonts.onest(
                              fontSize: 15,
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.all(1.5),
                          //   width: 20,
                          //   height: 20,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(4),
                          //     border: Border.all(
                          //         color: const Color(0xFFAF30BF), width: 1.5),
                          //   ),
                          //   child: Container(
                          //     color: item['selected']
                          //         ? const Color(0xFFAF30BF)
                          //         : Colors.white,
                          //   ),
                          // )
                          Checkbox(
                            value: controller.listTileData[index]['selected'],
                            onChanged: (bool? value) {
                              controller.updateSelection(
                                  index, value); // Actualiza la selección
                              // setState(() {});
                            },
                            activeColor:
                                item['selected'] ? const Color(0xFFAF30BF) : Colors.white,
                            checkColor: Colors.white,
                            // activeColor:
                            //     item['selected'] ? Colors.green : Colors.red,
                            // checkColor: Colors.white,
                          )
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            // Container(
            //   decoration: const BoxDecoration(
            //     border: Border(
            //       top: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
            //     ),
            //   ),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //     child: CustomBtn(
            //       text: 'Confirmar',
            //       status: 1,
            //       onPressed: () {
            //         setState(() {});
            //         Navigator.pop(context);
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
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
                      onTap: () => item['onTap'](),
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
