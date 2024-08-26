import 'package:ballots_template_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.placeHolder = 'Coloca algo',
    this.keyboardType = TextInputType.text,
  });

  final dynamic onChanged;
  final String placeHolder;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: GoogleFonts.onest(fontSize: 18, color: AppColors.blackColor),
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeHolder,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
