import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:ballots_template_flutter/controllers/list_controller.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/homeScreen/header_homescreen_body.dart';
import 'package:ballots_template_flutter/widgets/menu_list.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    final ListController controller = Get.find();
    TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
      appBarChildren: Text(
        "Generador de Recibo",
        style: theme.headlineLarge?.copyWith(color: AppColors.whiteColor),
      ),
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
