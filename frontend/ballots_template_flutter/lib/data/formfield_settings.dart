import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:flutter/material.dart';

createDataForTextFormField(FormController controller) {
  List formFieldSettings = [
    {
      'placeHolder': 'Nombre del establecimiento',
      'onChanged': (value) => controller.updateName(value),
      'customBackgroundColor': const Color(0xFFE0E0E0)
    },
    {
      'placeHolder': 'Indica tu teléfono',
      'keyboardType': TextInputType.phone,
      'onChanged': (value) => controller.updatePhone(value),
      'customBackgroundColor': const Color(0xFFE0E0E0)
    },
    {
      'placeHolder': 'Introduce tu dirección',
      'onChanged': (value) => controller.updateDirection(value),
      'customBackgroundColor': const Color(0xFFE0E0E0)
    },
    {
      'placeHolder': 'Escriba su correo electrónico',
      'keyboardType': TextInputType.emailAddress,
      'onChanged': (value) => controller.updateEmail(value),
      'customBackgroundColor': const Color(0xFFE0E0E0)
    },
    {
      'placeHolder': 'Número de Identificación de la empresa',
      'keyboardType': TextInputType.number,
      'onChanged': (value) => controller.updateRuc(value),
      'customBackgroundColor': const Color(0xFFE0E0E0)
    },
    {
      'placeHolder': 'Nombre de quien firmará',
      'onChanged': (value) => controller.updateNameOfFirm(value),
      'customBackgroundColor': const Color(0xFFE0E0E0)
    },
    {
      'placeHolder': 'Cargo de la persona que firma',
      'onChanged': (value) => controller.updatePositionOfFirm(value),
      'customBackgroundColor': const Color(0xFFE0E0E0)
    },
  ];

  return formFieldSettings;
}
