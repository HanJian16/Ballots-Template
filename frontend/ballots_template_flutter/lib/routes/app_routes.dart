import 'package:ballots_template_flutter/screens/invoice/invoice_screens.dart';
import 'package:ballots_template_flutter/screens/invoice/product_invoice_screen.dart';
import 'package:ballots_template_flutter/screens/invoice/service_invoice_screen.dart';
import 'package:ballots_template_flutter/screens/registrations/register_product_screen.dart';
import 'package:ballots_template_flutter/screens/registrations/register_service_screen.dart';
import 'package:ballots_template_flutter/screens/registrations/registrations_screen.dart';
import 'package:get/get.dart';
import 'package:ballots_template_flutter/screens/form_register_screens.dart';
import 'package:ballots_template_flutter/screens/home_screen.dart';

class AppRoutes {
  static const home = '/home';
  static const formRegister = '/form-register';
  static const invoice = '/invoice';
  static const productInvoice = '/invoice/product';
  static const serviceInvoice = '/invoice/service';
  static const registrations = '/registrations';
  static const registerProduct = '/registrations/product';
  static const registerService = '/registrations/service';

  static final routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: formRegister, page: () => const FormRegisterScreen()),
    GetPage(name: invoice, page: () => const InvoiceScreen()),
    GetPage(name: productInvoice, page: () => const ProductInvoiceScreen()),
    GetPage(name: serviceInvoice, page: () => const ServiceInvoiceScreen()),
    GetPage(name: registrations, page: () => const RegistrationsScreen()),
    GetPage(name: registerProduct, page: () => const RegisterProductScreen()),
    GetPage(name: registerService, page: () => const RegisterServiceScreen()),
  ];
}
