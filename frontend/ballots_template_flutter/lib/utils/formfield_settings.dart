import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ballots_template_flutter/controllers/index.dart';

createDataForTextFormField() {
  final controller = Get.find<SettingsController>();

  List formFieldSettings = [
    {
      'controller': controller.name,
      'placeHolder': 'Nombre del establecimiento',
      'validator': (value) => controller.validateName(value),
    },
    {
      'controller': controller.phone,
      'placeHolder': 'Indica tu teléfono',
      'keyboardType': TextInputType.phone,
      'validator': (value) => controller.validatePhone(value),
      'maxLength': 12,
    },
    {
      'controller': controller.direction,
      'placeHolder': 'Introduce tu dirección',
      'validator': (value) => controller.validateDirection(value),
    },
    {
      'controller': controller.email,
      'placeHolder': 'Escriba su correo electrónico',
      'keyboardType': TextInputType.emailAddress,
      'validator': (value) => controller.validateEmail(value),
    },
    {
      'controller': controller.ruc,
      'placeHolder': 'Número de Identificación de la empresa',
      'keyboardType': TextInputType.number,
      'validator': (value) => controller.validateRuc(value),
      'maxLength': 11,
    },
    {
      'controller': controller.nameOfFirm,
      'placeHolder': 'Nombre de quien firmará',
      'validator': (value) => controller.validateNameOfFirm(value),
    },
    {
      'controller': controller.positionOfFirm,
      'placeHolder': 'Cargo de la persona que firma',
      'validator': (value) => controller.validatePositionOfFirm(value),
    },
  ];

  return formFieldSettings;
}
