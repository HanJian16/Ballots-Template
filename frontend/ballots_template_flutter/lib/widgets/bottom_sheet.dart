import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ballots_template_flutter/theme/index.dart';
import 'package:ballots_template_flutter/controllers/index.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {super.key, required this.title, required this.controller});
  final String title;
  final ListMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColors.greyColor,
            ),
            child: Text(
              title,
              style: GoogleFonts.onest(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final listTileData = controller.listTileData;
              return ListView.builder(
                itemCount: listTileData.length,
                itemBuilder: (context, index) {
                  final item = listTileData[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['title'],
                          style: GoogleFonts.onest(
                            fontSize: 15,
                          ),
                        ),
                        Checkbox(
                          value: controller.listTileData[index]['selected'],
                          onChanged: (bool? value) {
                            controller.updateSelection(index, value);
                          },
                          activeColor: item['selected']
                              ? AppColors.primaryColor
                              : AppColors.whiteColor,
                          checkColor: AppColors.whiteColor,
                        )
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
