import 'package:ballots_template_flutter/controllers/form_controller.dart';
import 'package:flutter/material.dart';

createDataForTextFormField(FormController controller) {
  List formFieldSettings = [
    {
      'initialValue': controller.name.value,
      'placeHolder': 'Nombre del establecimiento',
      'onChanged': (value) => controller.updateName(value),
      'error': controller.nameError,
    },
    {
      'initialValue': controller.phone.value,
      'placeHolder': 'Indica tu teléfono',
      'keyboardType': TextInputType.phone,
      'onChanged': (value) => controller.updatePhone(value),
      'error': controller.phoneError,
      'maxLength': 12,
    },
    {
      'initialValue': controller.direction.value,
      'placeHolder': 'Introduce tu dirección',
      'onChanged': (value) => controller.updateDirection(value),
      'error': controller.directionError,
    },
    {
      'initialValue': controller.email.value,
      'placeHolder': 'Escriba su correo electrónico',
      'keyboardType': TextInputType.emailAddress,
      'onChanged': (value) => controller.updateEmail(value),
      'error': controller.emailError,
    },
    {
      'initialValue': controller.ruc.value,
      'placeHolder': 'Número de Identificación de la empresa',
      'keyboardType': TextInputType.number,
      'onChanged': (value) => controller.updateRuc(value),
      'error': controller.rucError,
      'maxLength': 11,
    },
    {
      'initialValue': controller.nameOfFirm.value,
      'placeHolder': 'Nombre de quien firmará',
      'onChanged': (value) => controller.updateNameOfFirm(value),
      'error': controller.nameOfFirmError,
    },
    {
      'initialValue': controller.positionOfFirm.value,
      'placeHolder': 'Cargo de la persona que firma',
      'onChanged': (value) => controller.updatePositionOfFirm(value),
      'error': controller.positionOfFirmError,
    },
  ];

  return formFieldSettings;
}
