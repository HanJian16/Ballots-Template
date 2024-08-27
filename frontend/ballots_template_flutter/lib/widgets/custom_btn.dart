import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    this.intRadius = 20,
    this.customColor = AppColors.primaryColor,
    this.customHeight = 50,
    this.onPressed,
    required this.status,
    this.customFontSize = 15,
  });

  final String text;
  final double intRadius;
  final double customHeight;
  final Color? customColor;
  final VoidCallback? onPressed;
  final double? customFontSize;
  final int status;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (onPressed != null && status == 1) {
          onPressed!();
        } else {
          return;
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: status == 0
            ? AppColors.greyColor.withOpacity(0.5)
            : Theme.of(context).primaryColor,
      ),
      child: Text(
        text,
        style: GoogleFonts.onest(
          fontSize: customFontSize,
          color: status == 0 ? AppColors.greyColor : AppColors.whiteColor,
        ),
      ),
    );
  }
}
