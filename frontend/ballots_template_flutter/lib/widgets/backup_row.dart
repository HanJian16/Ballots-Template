import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:ballots_template_flutter/theme/index.dart';

class BackupRow extends StatelessWidget {
  const BackupRow({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
  });

  final String text;
  final dynamic icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              style:
                  GoogleFonts.onest(fontSize: 15, fontWeight: FontWeight.w700),
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
      ),
    );
  }
}
