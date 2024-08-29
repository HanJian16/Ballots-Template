import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:flutter/material.dart';

createDataForTextFormField(FormController controller) {
  List formFieldSettings = [
    {
      'placeHolder': 'Nombre del establecimiento',
      'onChanged': (value) => controller.updateName(value),
      'error': controller.nameError,
    },
    {
      'placeHolder': 'Indica tu teléfono',
      'keyboardType': TextInputType.phone,
      'onChanged': (value) => controller.updatePhone(value),
      'error': controller.phoneError,
      'maxLength': 12,
    },
    {
      'placeHolder': 'Introduce tu dirección',
      'onChanged': (value) => controller.updateDirection(value),
      'error': controller.directionError,
    },
    {
      'placeHolder': 'Escriba su correo electrónico',
      'keyboardType': TextInputType.emailAddress,
      'onChanged': (value) => controller.updateEmail(value),
      'error': controller.emailError,
    },
    {
      'placeHolder': 'Número de Identificación de la empresa',
      'keyboardType': TextInputType.number,
      'onChanged': (value) => controller.updateRuc(value),
      'error': controller.rucError,
      'maxLength': 11,
    },
    {
      'placeHolder': 'Nombre de quien firmará',
      'onChanged': (value) => controller.updateNameOfFirm(value),
      'error': controller.nameOfFirmError,
    },
    {
      'placeHolder': 'Cargo de la persona que firma',
      'onChanged': (value) => controller.updatePositionOfFirm(value),
      'error': controller.positionOfFirmError,
    },
  ];

  return formFieldSettings;
}
