import 'package:ballots_template_flutter/theme/index.dart';
import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({
    super.key,
    required this.children,
    this.appBarChildren,
    this.appBarActions,
    this.backgroundColor,
     this.appBarHeight = kToolbarHeight, this.floatingActionButton, this.title,
  });

  final Widget children;
  final Widget? appBarChildren;
  final List<Widget>? appBarActions;
  final Color? backgroundColor;
  final double appBarHeight;
  final Widget? floatingActionButton;
  final String? title;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: title != null
          ? PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: AppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: backgroundColor,
                title: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(title!, style: theme.headlineLarge?.copyWith(color: AppColors.whiteColor),),
                ),
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
