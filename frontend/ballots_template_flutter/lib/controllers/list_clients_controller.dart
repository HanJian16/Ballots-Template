import 'package:ballots_template_flutter/models/client_model.dart';
import 'package:get/get.dart';

import 'package:ballots_template_flutter/db/index.dart';

class ListClientsController extends GetxController {
  List listClients = <Client>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDataDB();
  }

  getDataDB() async {
    final clientsDB = await getClients();
    final dataConverted = clientsDB.map((client) => Client.fromMap(client));
    listClients.assignAll(dataConverted);
  }
}
