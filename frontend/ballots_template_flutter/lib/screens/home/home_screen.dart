import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(ClientController());
    Get.put(InvoiceController());
    Get.put(ListController());
    Get.put(ListMenuController());
    Get.put(ProductController());
    Get.put(ServiceController());
    Get.put(SettingsController());
     Get.put(CompanyLogoController());
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ListMenuController>();
    return ScreenContainer(
      title: 'Generador de Recibo',
      appBarActions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(Icons.info_outline),
        )
      ],
      children: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderHomeScreenBody(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                final listTileData = controller.getSelectedItems();
                return MenuList(list: listTileData);
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
