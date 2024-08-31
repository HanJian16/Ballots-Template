import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: const EdgeInsets.all(8.0),
        width: Get.width * 0.25,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            const Icon(Icons.add, color: Colors.white),
            Text(
              ' Agregar',
              style: theme.headlineLarge?.copyWith(
                color: AppColors.whiteColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
