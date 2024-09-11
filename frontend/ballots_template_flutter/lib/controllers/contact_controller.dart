import 'package:ballots_template_flutter/models/index.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class ContactService {
  static const platform = MethodChannel('com.example.contacts');

  Future<List<Map<dynamic, dynamic>>> getContacts() async {
    try {
      final List<dynamic> contacts = await platform.invokeMethod('getContacts');
      return contacts.cast<Map<dynamic, dynamic>>();
    } catch (e) {
      NotificationHelper.show(
        title: 'Error',
        message: '$e',
        isError: true,
      );
      return [];
    }
  }
}

class ContactController extends GetxController {
  var contacts = <ContactModel>[].obs;
  var selectedContact = Rxn<ContactModel>();
  final clientController = Get.find<ClientController>();

  @override
  void onInit() {
    super.onInit();
    loadContacts();
  }

  Future<void> loadContacts() async {
    PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      ContactService contactService = ContactService();
      List<Map<dynamic, dynamic>> contactsFlutter =
          await contactService.getContacts();
      List<ContactModel> contactsConverted = contactsFlutter
          .map((contactMap) => ContactModel.fromMap(contactMap))
          .toList();
      // var allContacts = await ContactsService.getContacts();
      contacts.value = contactsConverted;
    } else {
      NotificationHelper.show(
        title: 'Error',
        message: 'No se pudo acceder a los contactos',
        isError: true,
      );
    }
  }

  // Seleccionar un contacto
  void selectContact(ContactModel contact) {
    selectedContact.value = contact;
    clientController.name.text = contact.name;
    clientController.updateNamePhone(contact.name);
    var phoneFormat = contact.phone.replaceFirst(RegExp(r'^\+\d{2}'), '');
    clientController.updateNumberPhone(phoneFormat);
    if (contact.phone != '') {
    } else {
      clientController.phone.text = contact.phone;
    }
  }
}
