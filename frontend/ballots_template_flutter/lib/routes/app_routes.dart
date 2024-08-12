import 'package:ballots_template_flutter/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/form_register.dart';

class AppRoutes {
  static const initial = '/';
  static const details = '/details';

  static final routes = [
    GetPage(name: initial, page: () => const HomeScreen()),
  ];
}
