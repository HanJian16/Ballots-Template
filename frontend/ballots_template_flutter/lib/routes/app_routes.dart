import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/details_screens.dart';

class AppRoutes {
  static const details = '/details';

  static final routes = [
    GetPage(name: details, page: () => const DetailsScreen()),
  ];
}