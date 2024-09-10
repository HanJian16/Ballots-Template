import 'package:ballots_template_flutter/widgets/index.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactController extends GetxController {
  var contacts = <Contact>[].obs;
  var selectedContact = Rxn<Contact>();

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
    print('Contacto seleccionado: ${contact.displayName}');
    selectedContact.value = contact;
  }
}
