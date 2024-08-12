import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/home_screen.dart';
import 'package:ballots_template_flutter/screens/details_screens.dart';

class AppRoutes {
  static const initial = '/';
  static const details = '/details';

  static final routes = [
    GetPage(name: initial, page: () => const HomeScreen()),
    GetPage(name: details, page: () => const DetailsScreen()),
  ];
}