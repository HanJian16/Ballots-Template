import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog(
      {super.key,
      required this.title,
      required this.onPress,
      required this.titleBtn,
      this.actionsBtn});
  final String title;
  final String titleBtn;
  final VoidCallback onPress;
  final Widget? actionsBtn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          const Icon(
            Icons.warning_sharp,
            size: 55,
            color: AppColors.warningColor,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.onest(
              fontSize: 15,
            ),
            // textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          if (actionsBtn != null) actionsBtn!,
          if(actionsBtn == null)
          CustomBtn(
            text: titleBtn,
            status: 1,
            onPressed: () {
              onPress();
            },
          ),
        ],
      ),
    );
  }
}
