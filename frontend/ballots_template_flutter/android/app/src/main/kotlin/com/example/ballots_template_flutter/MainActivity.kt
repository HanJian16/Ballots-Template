package com.example.ballots_template_flutter

import android.database.Cursor
import android.provider.ContactsContract
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.contacts"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Usar el método del engine para obtener el binaryMessenger
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getContacts") {
                val contacts = getContacts()
                if (contacts != null) {
                    result.success(contacts)
                } else {
                    result.error("UNAVAILABLE", "No contacts found.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getContacts(): ArrayList<HashMap<String, String>> {
        val contactsList = ArrayList<HashMap<String, String>>()

        val cursor: Cursor? = contentResolver.query(
            ContactsContract.Contacts.CONTENT_URI,
            null,
            ContactsContract.Contacts.DISPLAY_NAME_PRIMARY + " IS NOT NULL", // Filtro para contactos con nombre
            null,
            ContactsContract.Contacts.DISPLAY_NAME_PRIMARY + " ASC" // Ordenados por nombre
        )

        if (cursor != null && cursor.count > 0) {
            while (cursor.moveToNext()) {
                val contactId = cursor.getString(cursor.getColumnIndex(ContactsContract.Contacts._ID))
                val displayName = cursor.getString(cursor.getColumnIndex(ContactsContract.Contacts.DISPLAY_NAME_PRIMARY))

                // Crear un mapa para el contacto
                val contact = HashMap<String, String>()
                contact["name"] = displayName

                val phoneCursor: Cursor? = contentResolver.query(
                    ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                    null,
                    ContactsContract.CommonDataKinds.Phone.CONTACT_ID + " = ?",
                    arrayOf(contactId),
                    null
                )

                if (phoneCursor != null && phoneCursor.count > 0) {
                    while (phoneCursor.moveToNext()) {
                        val phoneNumber = phoneCursor.getString(phoneCursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER))
                        contact["phone"] = phoneNumber // Añadir el número de teléfono al contacto
                    }
                    phoneCursor.close()
                }

                // Añadir a la lista de contactos
                contactsList.add(contact)
            }
            cursor.close()
        }

        return contactsList
    }
}
