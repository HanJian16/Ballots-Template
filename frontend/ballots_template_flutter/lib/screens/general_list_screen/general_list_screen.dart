import 'package:ballots_template_flutter/utils/general_list_screen_utils/general_list_screen_data.dart';
import 'package:ballots_template_flutter/widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/screen_container.dart';

class GeneralListScreen extends StatelessWidget {
  const GeneralListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return ScreenContainer(
        appBarChildren: Text(
          'Lista de Productos / Servicios',
          style: theme.headlineLarge?.copyWith(color: AppColors.whiteColor),
        ),
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
