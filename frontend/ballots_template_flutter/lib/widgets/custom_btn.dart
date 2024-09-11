import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/theme/index.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    this.customColor = AppColors.primaryColor,
    this.onPressed,
    required this.status,
    this.customFontSize = 15,
  });

  final String text;
  final Color? customColor;
  final VoidCallback? onPressed;
  final double? customFontSize;
  final int status;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return TextButton(
      onPressed: () {
        if (onPressed != null && status == 1) {
          onPressed!();
        } else {
          return;
        }
      },
      style: TextButton.styleFrom(
        backgroundColor:
            status == 0 ? AppColors.greyColor : customColor,
      ),
      child: Text(
        text,
        style: theme.headlineLarge?.copyWith(
          fontSize: customFontSize,
          color: status == 0 ? AppColors.blackColor.withOpacity(0.3) : AppColors.whiteColor,
          // fontWeight: FontWeight.normal
        )
      ),
    );
  }
}
