import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/models/index.dart';

class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({
    super.key,
    required this.store,
  });

  final Store? store;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          store?.nameStore ?? '',
          style: theme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Text(
                    'RUC: ${store?.rucStore ?? ''}',
                    style: theme.bodySmall,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tel: ${store?.phoneStore ?? ''}',
                    style: theme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Text(
                  'Dir: ${store?.addressStore ?? ''}',
                  style: theme.bodySmall,
                ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    'Email: ${store?.emailStore ?? ''}',
                    style: theme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
