import 'package:get/get.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class ContactController extends GetxController {
  var contacts = <Contact>[].obs;
  var selectedContact = Rxn<Contact>();
  final clientController = Get.find<ClientController>();

  @override
  void onInit() {
    super.onInit();
    loadContacts();
  }

  // Cargar los contactos si se conceden permisos
  Future<void> loadContacts() async {
    PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      var allContacts= await ContactsService.getContacts();
      contacts.value = allContacts;
    } else {
     NotificationHelper.show(
        title: 'Error',
        message: 'No se pudo acceder a los contactos',
        isError: true,
      );
    }
  }

  // Seleccionar un contacto
  void selectContact(Contact contact) {
    selectedContact.value = contact;
    clientController.name.text = contact.displayName ?? '';
    clientController.updateNamePhone(contact.displayName ?? '');
    var phoneFormat = contact.phones!.first.value!.replaceAll(RegExp(r'^\+\d+\s*'), '');
    clientController.updateNumberPhone(phoneFormat);
    if(contact.phones == []){
    } else {
     clientController.phone.text = contact.phones!.first.value!;
    }
  }
}
