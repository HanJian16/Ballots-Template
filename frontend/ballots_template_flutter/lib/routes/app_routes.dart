import 'package:get/get.dart';

import 'package:ballots_template_flutter/screens/index.dart';

class AppRoutes {
  static const home = '/home';
  static const settings = '/settings';
  static const invoice = '/invoice';
  static const productInvoice = '/invoice/product';
  static const serviceInvoice = '/invoice/service';
  static const registrations = '/registrations';
  static const registerProduct = '/registrations/product';
  static const registerService = '/registrations/service';
  static const generalList = '/general-list';
  static const productList = '/general-list/product';
  static const serviceList = '/general-list/service';
  static const addProduct = '/add-product';
  static const clients = '/clients';
  static const addClient = '/clients/add';

  static final routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: settings, page: () => const SettingsScreen()),
    GetPage(name: invoice, page: () => const InvoiceScreen()),
    GetPage(name: productInvoice, page: () => const ProductInvoiceScreen()),
    GetPage(name: serviceInvoice, page: () => const ServiceInvoiceScreen()),
    GetPage(name: registrations, page: () => const RegistrationsScreen()),
    GetPage(name: registerProduct, page: () => const RegisterProductScreen()),
    GetPage(name: registerService, page: () => const RegisterServiceScreen()),
    GetPage(name: generalList, page: () => const GeneralListScreen()),
    GetPage(name: productList, page: () => const ProductListScreen()),
    GetPage(name: addProduct, page: () => const AddProductScreen()),
    GetPage(name: clients, page: () => const ClientsScreen()),
    GetPage(name: addClient, page: () => const AddClientScreen()),
  ];
}
