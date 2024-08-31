import 'package:ballots_template_flutter/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load();
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.circularReveal,
      debugShowCheckedModeBanner: false,
      title: "Ballots Template",
      initialRoute: AppRoutes.home,
      theme: buildTheme(),
      themeMode: ThemeMode.system,
      getPages: AppRoutes.routes,
    );
  }
}
