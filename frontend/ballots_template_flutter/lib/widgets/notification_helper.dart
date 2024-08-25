import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      colorText: isError ? Colors.white : Colors.black,
      backgroundColor: backgroundColor ?? (isError ? Colors.redAccent : Colors.greenAccent),
      duration: const Duration(seconds: 3),
      icon: Icon(
        icon ?? (isError ? Icons.error : Icons.check_circle),
        color: isError ? Colors.white : Colors.black,
      ),
      borderRadius: 8,
    );
  }
}
