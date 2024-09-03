import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class WarningDialogHelper {
  static void show({
    String? title,
    String? message,
    Widget? actionsBtn,
    VoidCallback? onPress,
    String? titleBtn,
  }) {
    Get.defaultDialog(
      title: title ?? '',
      titleStyle: GoogleFonts.onest(
        fontSize: 1,
      ),
      content: SizedBox(
        height: 170,
        child: Column(
          children: [
            const Icon(
              Icons.warning_sharp,
              size: 55,
              color: AppColors.warningColor,
            ),
            const SizedBox(height: 10),
            Text(
              message ?? '',
              style: GoogleFonts.onest(
                fontSize: 15,
              ),
              // textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            if (actionsBtn != null) actionsBtn,
            if (actionsBtn == null)
              CustomBtn(
                text: titleBtn ?? '',
                status: 1,
                onPressed: () {
                  if (onPress != null) {
                    onPress();
                  } else {
                    return;
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
