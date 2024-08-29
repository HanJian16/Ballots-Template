import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:ballots_template_flutter/utils/formatters/phone_number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.placeHolder = 'Coloca algo',
    this.keyboardType = TextInputType.text,
    required this.error,
    this.maxLength, required this.initialValue,
  });

  final dynamic onChanged;
  final String placeHolder;
  final TextInputType? keyboardType;
  final RxString error;
  final int? maxLength;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          TextFormField(
            initialValue: initialValue,
            style: GoogleFonts.onest(fontSize: 18, color: AppColors.blackColor),
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: placeHolder,
              errorText: error.value.isNotEmpty ? error.value : null,
              counterText: '',
            ),
            // maxLength: maxLength,
            inputFormatters: [
              if (maxLength != null)
                LengthLimitingTextInputFormatter(maxLength),
              if (keyboardType == TextInputType.phone) PhoneNumberFormatter(),
            ],
          ),
          const SizedBox(height: 15),
        ],
      );
    });
  }
}
