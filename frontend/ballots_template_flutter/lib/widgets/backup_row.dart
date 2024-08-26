import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackupRow extends StatelessWidget {
  const BackupRow({
    super.key,
    required this.text,
    this.icon,
  });

  final String text;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.greyColor,
            size: 25,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.onest(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          const Text(
            "",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
