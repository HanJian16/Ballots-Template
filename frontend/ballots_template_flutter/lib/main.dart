import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ballots Template",
      initialRoute: AppRoutes.initial,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.onestTextTheme(),
      ),
      getPages: AppRoutes.routes,
    );
  }
}
