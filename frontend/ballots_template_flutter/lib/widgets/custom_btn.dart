import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    this.intRadius = 20,
    required this.customColor,
    this.customHeight = 35,
    this.customWidth = 100, this.onPressed,
  });

  final String text;
  final double intRadius;
  final double customHeight;
  final double customWidth;
  final Color customColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: customColor,
          borderRadius: BorderRadius.circular(intRadius),
        ),
        height: customHeight,
        width: customWidth,
        child: Text(
          text,
          style: GoogleFonts.onest(
            fontSize: 12,
            color: const Color(0xFFFFFFFF),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
