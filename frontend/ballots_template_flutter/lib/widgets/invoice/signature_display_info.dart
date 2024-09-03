import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/models/index.dart';

class SignatureDisplayInfo extends StatelessWidget {
  const SignatureDisplayInfo({
    super.key,
    this.store,
  });

  final Store? store;

  String formatDate(DateTime dateTime) {
    // Define el formato que deseas: día/mes/año hora:minuto
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.memory(
                store!.signature,
                height: 40,
              ),
              // const SizedBox(height: 2,),
              const Divider(
                color: AppColors.blackColor,
                thickness: 1,
              ),
              Text(store?.signerName ?? '', style: theme.bodySmall),
              Text(
                store?.signerRole ?? '',
                style: theme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              Container()
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          width: double.infinity,
          child: Text(formatDate(DateTime.now()), style: theme.bodySmall),
        ),
      ],
    );
  }
}