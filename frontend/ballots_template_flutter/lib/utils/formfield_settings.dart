import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:flutter/material.dart';

createDataForTextFormField(FormController controller) {
  List formFieldSettings = [
    {
      'placeHolder': 'Nombre del establecimiento',
      'onChanged': (value) => controller.updateName(value),
    },
    {
      'placeHolder': 'Indica tu teléfono',
      'keyboardType': TextInputType.phone,
      'onChanged': (value) => controller.updatePhone(value),
    },
    {
      'placeHolder': 'Introduce tu dirección',
      'onChanged': (value) => controller.updateDirection(value),
    },
    {
      'placeHolder': 'Escriba su correo electrónico',
      'keyboardType': TextInputType.emailAddress,
      'onChanged': (value) => controller.updateEmail(value),
    },
    {
      'placeHolder': 'Número de Identificación de la empresa',
      'keyboardType': TextInputType.number,
      'onChanged': (value) => controller.updateRuc(value),
    },
    {
      'placeHolder': 'Nombre de quien firmará',
      'onChanged': (value) => controller.updateNameOfFirm(value),
    },
    {
      'placeHolder': 'Cargo de la persona que firma',
      'onChanged': (value) => controller.updatePositionOfFirm(value),
    },
  ];

  return formFieldSettings;
}
