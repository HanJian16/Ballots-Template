import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({
    super.key,
    required this.children,
    this.appBarChildren,
    this.appBarActions,
    this.backgroundColor,
     this.appBarHeight = kToolbarHeight, this.floatingActionButton,
  });

  final Widget children;
  final Widget? appBarChildren;
  final List<Widget>? appBarActions;
  final Color? backgroundColor;
  final double appBarHeight;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBarChildren != null
          ? PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: AppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: backgroundColor,
                title: appBarChildren,
                actions: appBarActions ?? [],
              ),
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
      floatingActionButton: floatingActionButton,
    );
  }
}
