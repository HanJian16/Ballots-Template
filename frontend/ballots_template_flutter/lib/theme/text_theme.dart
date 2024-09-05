import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:ballots_template_flutter/theme/index.dart';

TextTheme buildTextTheme() {
  return GoogleFonts.onestTextTheme(
      ThemeData.light()
          .textTheme
          .apply(
            bodyColor: AppColors.blackColor,
            displayColor: AppColors.blackColor,
          )
          .copyWith(
            displayLarge:
                const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            headlineMedium:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            headlineLarge:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            titleLarge:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            bodyLarge: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
    );
}
