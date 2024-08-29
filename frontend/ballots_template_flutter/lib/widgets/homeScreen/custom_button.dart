import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    this.onPressed,
  });
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
      ),
      color: color,
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
