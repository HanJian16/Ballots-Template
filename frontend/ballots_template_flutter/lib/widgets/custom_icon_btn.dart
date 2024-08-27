import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.onest(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: AppColors.greyColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                icon,
                color: AppColors.blackColor,
                size: 25,
              ),
              onPressed: () => onPressed(),
            ),
          ),
        ),
      ],
    );
  }
}
