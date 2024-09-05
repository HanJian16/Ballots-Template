import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/theme/index.dart';

class NotificationHelper {
  static void show({
    required String title,
    required String message,
    bool isError = false,
    Color? backgroundColor,
    IconData? icon,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: isError ? AppColors.whiteColor : AppColors.blackColor,
      backgroundColor: backgroundColor ??
          (isError ? AppColors.errorColor : AppColors.successColor),
      duration: const Duration(seconds: 1),
      icon: Icon(
        icon ?? (isError ? Icons.error : Icons.check_circle),
        color: isError ? AppColors.whiteColor : AppColors.blackColor,
      ),
      borderRadius: 8,
    );
  }
}
