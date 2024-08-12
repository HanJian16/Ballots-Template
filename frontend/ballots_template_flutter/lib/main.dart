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
      title: "Ballots Template",
      initialRoute: AppRoutes.details,
      getPages: AppRoutes.routes,
    );
  }
}
