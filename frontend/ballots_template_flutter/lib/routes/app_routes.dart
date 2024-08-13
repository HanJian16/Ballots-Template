import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/form_register.dart';
import 'package:ballots_template_flutter/screens/home_screen.dart';

class AppRoutes {
  static const initial = '/';
  static const formRegister = '/form-register';

  static final routes = [
    GetPage(name: initial, page: () => const HomeScreen()),
    GetPage(name: formRegister, page: () => const FormRegisterScreen()),
  ];
}
