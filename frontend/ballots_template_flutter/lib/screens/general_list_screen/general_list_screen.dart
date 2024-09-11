import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/utils/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class GeneralListScreen extends StatelessWidget {
  const GeneralListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
        title: 'Lista de productos o servicios',
        children: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Lista de productos y servicios', style: theme.titleLarge),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: MenuList(
                  list: GeneralListScreenResources.generalListMenuOptions,
                ),
              )
            ],
          ),
        ));
  }
}
