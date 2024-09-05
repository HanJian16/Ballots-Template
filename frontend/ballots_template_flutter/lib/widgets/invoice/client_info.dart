import 'package:ballots_template_flutter/controllers/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientInfoWidget extends StatelessWidget {
  const ClientInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    final invoiceController = Get.find<InvoiceController>();

    return Obx(
      () {
        final client = invoiceController.client.value;
        return Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'N° ${invoiceController.invoiceId.value}',
              style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text('Cliente: ${client?.name ?? ''}', style: theme.bodySmall),
            Text(
              'Documentos: ${client?.document ?? ''}',
              style: theme.bodySmall,
            ),
            Text(
              'Teléfono: ${client?.phone ?? ''}',
              style: theme.bodySmall,
            ),
            Text(
              'Dirección: ${client?.address ?? ''}',
              style: theme.bodySmall,
            ),
          ]),
        );
      },
    );
  }
}
