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
        const BubbleCustom(
          top: 50,
          left: 45,
        ),
        const BubbleCustom(
          top: 30,
          right: 25,
        ),
        const BubbleCustom(
          top: 140,
          right: 140,
        ),
        const BubbleCustom(
          top: 280,
          left: 120,
        ),
        const BubbleCustom(
          bottom: 300,
          right: 120,
        ),
        const BubbleCustom(
          bottom: 300,
          left: 10,
        ),
        const BubbleCustom(
          bottom: 30,
          right: 100,
        ),
        const BubbleCustom(
          bottom: 140,
          left: 140,
        ),
        const BubbleCustom(
          bottom: -10,
          left: -15,
        ),
      ],
    );
  }
}
