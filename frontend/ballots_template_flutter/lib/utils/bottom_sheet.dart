import 'package:flutter/material.dart';

void showCustomBottomSheet({required BuildContext context, required Widget content, double heightPercentage = 0.12}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * heightPercentage,
        color: Colors.white,
        child: content,
      );
    },
  );
}
