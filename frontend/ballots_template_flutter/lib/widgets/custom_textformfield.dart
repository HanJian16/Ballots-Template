import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.placeHolder = 'Coloca algo',
    this.customBackgroundColor = Colors.grey, this.keyboardType = TextInputType.text,
  });

  final dynamic onChanged;
  final String placeHolder;
  final Color customBackgroundColor;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: GoogleFonts.onest(fontSize: 18, color: Colors.black),
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeHolder,
            filled: true,
            fillColor: customBackgroundColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: customBackgroundColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: customBackgroundColor,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: customBackgroundColor, // Color del borde cuando está habilitado
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
