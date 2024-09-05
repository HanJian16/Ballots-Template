import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class HeaderHomeScreenBody extends StatelessWidget {
  const HeaderHomeScreenBody({
    super.key,
  });

  void showBottomSheet(BuildContext context) {
    final controller = Get.find<ListMenuController>();

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
    return Container(
      decoration: const BoxDecoration(color: AppColors.whiteColor),
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
              backgroundColor: AppColors.errorColor,
              color: AppColors.whiteColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
