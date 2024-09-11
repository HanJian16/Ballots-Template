import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/models/index.dart';

class DetailFields extends StatelessWidget {
  const DetailFields({
    super.key,
    required Product? product,
    required Service? service,
    required this.category,
  })  : _product = product,
        _service = service;

  final String category;
  final Product? _product;
  final Service? _service;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (category != 'Servicios')
          TextFormField(
            enabled: false,
            // controller: field['controller'],
            decoration: InputDecoration(
                hintText: _product?.productName, counterText: ''),
          ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          enabled: false,
          // controller: field['controller'],
          decoration: InputDecoration(
              hintText: category == 'Servicios'
                  ? _service?.description
                  : _product?.productDescription,
              counterText: ''),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          enabled: false,
          // controller: field['controller'],
          decoration: InputDecoration(
              hintText: category == 'Servicios'
                  ? _service?.value.toString()
                  : _product?.productValue.toString(),
              counterText: ''),
        ),
      ],
    );
  }
}
