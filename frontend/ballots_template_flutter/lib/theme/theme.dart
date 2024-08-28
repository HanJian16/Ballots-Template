import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor, // Color principal
    hintColor: AppColors.greyColor,
    // Configuración de fuentes
    textTheme: GoogleFonts.onestTextTheme(
      ThemeData.light().textTheme.apply(
            bodyColor: AppColors.blackColor,
            displayColor: AppColors.blackColor,
          ),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor, // Color de la AppBar
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      titleTextStyle: TextStyle(color: AppColors.whiteColor, fontSize: 20),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.buttonColor, // Color de botones
      textTheme: ButtonTextTheme.primary,
    ),
    // Configuración de texto
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.buttonTextColor,
        backgroundColor: AppColors.buttonColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.buttonColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyColor,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.greyColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.greyColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.greyColor, // Color del borde cuando está habilitado
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      hintStyle: GoogleFonts.onest(
        color: AppColors.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
