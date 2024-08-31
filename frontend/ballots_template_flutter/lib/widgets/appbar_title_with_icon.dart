import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/theme/index.dart';

class AppBarTitleWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final List<Map<String, dynamic>>? list;

  const AppBarTitleWithIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: theme.headlineLarge?.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        if (list != null)
          Row(
            children: list!.map((item) {
              final icon = item['icon'];
              final onPressed = item['onPressed'];
              final background = item['background'] ?? AppColors.greyColor;
              final color = item['color'] ?? AppColors.whiteColor;
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: background,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        icon,
                        color: color,
                        size: 25,
                      ),
                      onPressed: onPressed,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
