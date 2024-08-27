import 'package:ballots_template_flutter/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';

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
      theme: buildTheme(),
      themeMode: ThemeMode.system,
      getPages: AppRoutes.routes,
    );
  }
}
