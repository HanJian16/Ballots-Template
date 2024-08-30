import 'package:ballots_template_flutter/screens/auth/login_screen.dart';
import 'package:ballots_template_flutter/screens/invoice/invoice_screens.dart';
import 'package:ballots_template_flutter/screens/invoice/product_invoice_screen.dart';
import 'package:ballots_template_flutter/screens/invoice/service_invoice_screen.dart';
import 'package:ballots_template_flutter/screens/registrations/registrations_screen.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/form_register_screens.dart';
import 'package:ballots_template_flutter/screens/home_screen.dart';

class AppRoutes {
  static const initial = '/';
  static const home = '/home';
  static const formRegister = '/form-register';
  static const invoice = '/invoice';
  static const productInvoice = '/invoice/product';
  static const serviceInvoice = '/invoice/service';
  static const registrations = '/registrations';

  static final routes = [
    GetPage(name: initial, page: () => const LoginScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: formRegister, page: () => const FormRegisterScreen()),
    GetPage(name: invoice, page: () => const InvoiceScreen()),
    GetPage(name: productInvoice, page: () => const ProductInvoiceScreen()),
    GetPage(name: serviceInvoice, page: () => const ServiceInvoiceScreen()),
    GetPage(name: registrations, page: () => const RegistrationsScreen()),
  ];
}
