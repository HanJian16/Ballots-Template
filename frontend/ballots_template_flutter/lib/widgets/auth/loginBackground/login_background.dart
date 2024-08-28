import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/widgets/auth/loginBackground/buble_custom.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, double>> bubblePositions = [
      {'top': 50, 'left': 45},
      {'top': 30, 'right': 25},
      {'top': 140, 'right': 140},
      {'top': 280, 'left': 120},
      {'bottom': 300, 'right': 120},
      {'bottom': 300, 'left': 10},
      {'bottom': 30, 'right': 100},
      {'bottom': 140, 'left': 140},
      {'bottom': -10, 'left': -15},
    ];

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: child,
        ),
        ...bubblePositions.map(
          (position) => BubbleCustom(
            top: position['top'],
            left: position['left'],
            right: position['right'],
            bottom: position['bottom'],
          ),
        )
      ],
    );
  }
}
