import 'package:get/get.dart';

import 'package:ballots_template_flutter/screens/index.dart';

class AppRoutes {
  static const home = '/home';
  //*************************************************************************
  static const settings = '/settings';
  static const signatureSettings = '/settings/signature';
  //*************************************************************************
  static const invoice = '/invoice';
  static const productInvoice = '/invoice/product/:historyId';
  static const serviceInvoice = '/invoice/service/:historyId';
  //*************************************************************************
  static const registrations = '/registrations';
  static const registerProduct = '/registrations/product';
  static const editProduct = '/registrations/product/:id';
  static const registerService = '/registrations/service';
  static const editService = '/registrations/service/:id';
  //*************************************************************************
  static const generalList = '/general-list';
  static const productList = '/general-list/product';
  static const serviceList = '/general-list/service';
  static const historyProductList = '/general-list/history-product';
  static const historyServiceList = '/general-list/history-service';
  //*************************************************************************
  static const clients = '/clients';
  static const addClient = '/clients/add/:phone';
  static const editClient = '/clients/edit/:id';
  static const addClientFromPhone = '/clients/add-from-phone';
  //*************************************************************************
  static const addInBallotProduct = '/listSelection/product';
  static const addInBallotService = '/listSelection/service';
  static const addInBallotClient = '/listSelection/client';
  //*************************************************************************
  static const bluetoohConnect = '/bluetooth/connect';
  //*************************************************************************
  static const history = '/history';
  static const historyProduct = '/history/product';
  static const historyService = '/history/service';

  static final routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: settings, page: () => const SettingsScreen()),
    GetPage(name: signatureSettings, page: () => const SignatureScreen()),
    GetPage(name: invoice, page: () => const InvoiceMenuScreen()),
    GetPage(
      name: productInvoice,
      page: () => const CreateInvoiceScreen(category: 'product'),
    ),
    GetPage(
      name: serviceInvoice,
      page: () => const CreateInvoiceScreen(category: 'service'),
    ),
    GetPage(name: registrations, page: () => const RegistrationsScreen()),
    GetPage(
      name: registerProduct,
      page: () => const AddProductScreen(type: 'register'),
    ),
    GetPage(
      name: editProduct,
      page: () => const AddProductScreen(type: 'edit'),
    ),
    GetPage(
      name: registerService,
      page: () => const AddServiceScreen(type: 'register'),
    ),
    GetPage(
      name: editService,
      page: () => const AddServiceScreen(type: 'edit'),
    ),
    GetPage(name: generalList, page: () => const GeneralListScreen()),
    GetPage(
      name: productList,
      page: () => const ListScreen(type: 'product'),
    ),
    GetPage(
      name: serviceList,
      page: () => const ListScreen(type: 'service'),
    ),
    GetPage(
      name: clients,
      page: () => const ListScreen(type: 'client'),
    ),
    GetPage(name: addClient, page: () => const AddClientScreen(type: 'add')),
    GetPage(name: editClient, page: () => const AddClientScreen(type: 'edit')),
    GetPage(
      name: addInBallotProduct,
      page: () => const ListScreen(
        type: 'product',
        addInBallot: true,
      ),
    ),
    GetPage(
        name: addInBallotService,
        page: () => const ListScreen(
              type: 'service',
              addInBallot: true,
            )),
    GetPage(
      name: addInBallotClient,
      page: () => const ListScreen(
        type: 'client',
        addInBallot: true,
      ),
    ),
    GetPage(name: bluetoohConnect, page: () => const BluetoohScreen()),
    GetPage(name: history, page: () => const HistoryMenuList()),
    GetPage(
      name: historyProductList,
      page: () => const ListScreen(type: 'history-product'),
    ),
    GetPage(
      name: historyServiceList,
      page: () => const ListScreen(type: 'history-service'),
    ),
    GetPage(
      name: addClientFromPhone,
      page: () => const AddClientFromPhoneScreen(),
    ),
  ];
}
