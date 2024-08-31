import 'package:ballots_template_flutter/controllers/list_controller.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/bottom_sheet.dart';
import 'package:ballots_template_flutter/widgets/homeScreen/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderHomeScreenBody extends StatelessWidget {
  const HeaderHomeScreenBody({
    super.key,
  });

  void showBottomSheet(BuildContext context) {
    final ListController controller = Get.find();

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
              backgroundColor: AppColors.buttonColor,
              color: AppColors.whiteColor,
              onPressed: () {},
            ),
            // CustomButton(
            //   icon: Icons.format_list_bulleted_add,
            //   backgroundColor: AppColors.buttonColorSecondary,
            //   color: AppColors.blackColor,
            //   onPressed: () {
            //     // showBottomSheet(context);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
