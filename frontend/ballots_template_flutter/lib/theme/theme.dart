import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  return ThemeData(
    // Configuración de fuentes
    textTheme: GoogleFonts.onestTextTheme(
      ThemeData.light()
          .textTheme
          .apply(bodyColor: Colors.black, displayColor: Colors.black),
    ),
    primaryColor: Colors.blueGrey[800], // Color principal
    hintColor: Colors.tealAccent[400],
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey[800], // Color de la AppBar
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.tealAccent[400], // Color de botones
      textTheme: ButtonTextTheme.primary,
    ),
    // Configuración de texto
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.tealAccent[400]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.tealAccent[400],
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.tealAccent),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.blueGrey,
      secondary: Colors.tealAccent,
      surface: Colors.grey,
    ).copyWith(primary: Colors.blue, surface: Colors.white),
  );
}
