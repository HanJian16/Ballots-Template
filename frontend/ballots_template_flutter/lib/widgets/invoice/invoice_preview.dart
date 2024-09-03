import 'package:flutter/material.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/models/index.dart';
import 'package:ballots_template_flutter/widgets/index.dart';

class InvoicePreviewWidget extends StatelessWidget {
  const InvoicePreviewWidget({
    super.key,
    required this.store, required this.category,
  });

  final Store? store;
  final String category;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(5.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.blackColor, width: 0.8),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StoreInfoWidget(store: store),
              const SizedBox(height: 30),
              const ClientInfoWidget(),
              Text(
                category,
                style: theme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                color: AppColors.blackColor,
                height: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: AppColors.blackColor,
                height: 1,
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              if (store != null)
                SignatureDisplayInfo(
                  store: store,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
