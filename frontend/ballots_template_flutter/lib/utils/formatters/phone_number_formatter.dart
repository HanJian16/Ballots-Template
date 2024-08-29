import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Eliminar todos los caracteres no numéricos
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Si el texto es mayor que 9, truncar
    if (newText.length > 9) {
      newText = newText.substring(0, 9);
    }

    // Formatear el texto en bloques de 3 dígitos
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i > 0 && i % 3 == 0) {
        formattedText += ' ';
      }
      formattedText += newText[i];
    }

    // Retornar el nuevo valor del texto
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
