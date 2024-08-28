import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

class BubbleCustom extends StatelessWidget {
  const BubbleCustom({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
