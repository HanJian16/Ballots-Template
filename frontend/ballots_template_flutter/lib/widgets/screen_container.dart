import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer(
      {super.key,
      required this.children,
      this.appBarChildren,
      this.appBarActions,
      this.backgroundColor = Colors.white});

  final Widget children;
  final Widget? appBarChildren;
  final List<Widget>? appBarActions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      appBar: appBarChildren != null
          ? AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: backgroundColor,
              title: appBarChildren,
              actions: appBarActions ?? [],
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            child: children,
          ),
        ),
      ),
    );
  }
}
