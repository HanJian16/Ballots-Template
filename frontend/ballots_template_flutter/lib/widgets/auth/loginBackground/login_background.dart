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
          decoration: BoxDecoration(
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
        BubbleCustom(
          top: 50,
          left: 45,
        ),
        BubbleCustom(
          top: 30,
          right: 25,
        ),
        BubbleCustom(
          top: 140,
          right: 140,
        ),
        BubbleCustom(
          top: 280,
          left: 120,
        ),
        BubbleCustom(
          bottom: 300,
          right: 120,
        ),
        BubbleCustom(
          bottom: 300,
          left: 10,
        ),
        BubbleCustom(
          bottom: 30,
          right: 100,
        ),
        BubbleCustom(
          bottom: 140,
          left: 140,
        ),
        BubbleCustom(
          bottom: -10,
          left: -15,
        ),
      ],
    );
  }
}
