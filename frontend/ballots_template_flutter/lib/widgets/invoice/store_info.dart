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
      children: [
        Text(
          store?.nameStore ?? '',
          style: theme.headlineLarge,
        ),
        Text(store?.rucStore ?? '', style: theme.bodySmall),
        Text(store?.addressStore ?? '', style: theme.bodySmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Teléfono:${store?.phoneStore ?? ''}', style: theme.bodySmall),
            Text(
              ' | ',
              style: theme.bodySmall,
            ),
            Text(store?.emailStore ?? '', style: theme.bodySmall),
          ],
        ),
      ],
    );
  }
}
