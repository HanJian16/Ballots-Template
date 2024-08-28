import 'package:ballots_template_flutter/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/form_register_screens.dart';
import 'package:ballots_template_flutter/screens/home_screen.dart';

class AppRoutes {
  static const initial = '/';
  static const home = '/home';
  static const formRegister = '/form-register';

  static final routes = [
    GetPage(name: initial, page: () => const LoginScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: formRegister, page: () => const FormRegisterScreen()),
  ];
}
