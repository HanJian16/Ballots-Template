import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class WarningDialogHelper {
  static void show({
    String? title,
    String? message,
    String? confirmText,
    String? cancelText,
    VoidCallback? confirmOnPress,
    VoidCallback? cancelOnPress,
  }) {
    Get.defaultDialog(
      title: title ?? '',
      titlePadding: title != null
          ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
          : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      confirm: confirmText != null
          ? CustomBtn(
              text: confirmText,
              status: 1,
              onPressed: confirmOnPress,
            )
          : null,
      cancel: cancelText != null
          ? CustomBtn(
              customColor: AppColors.errorColor,
              text: cancelText,
              status: 1,
              onPressed: cancelOnPress,
            )
          : null,
      titleStyle: GoogleFonts.onest(
        fontSize: title != null ? 25 : 1,
      ),
      content: Column(
        children: [
          const Icon(
            Icons.warning_sharp,
            size: 55,
            color: AppColors.warningColor,
          ),
          const SizedBox(height: 20),
          Text(
            message ?? '',
            style: GoogleFonts.onest(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
