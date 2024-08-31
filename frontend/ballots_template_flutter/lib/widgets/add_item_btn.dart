import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/theme/index.dart';

class AddItemBtn extends StatelessWidget {
  const AddItemBtn({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: Get.width * 0.3,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.white),
            Text(
              ' Agregar',
              style: theme.headlineLarge?.copyWith(
                color: AppColors.whiteColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
