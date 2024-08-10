import 'package:flutter/material.dart';
import 'package:suitmedia_batch7/constant/color_constant.dart';
import 'package:suitmedia_batch7/constant/text_style_constant.dart';

class TextFieldCustomWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const TextFieldCustomWidget(
      {super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 39.88,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: const EdgeInsets.only(left: 20),
            labelText: label,
            labelStyle: TextStyleConstant.poppins500.copyWith(
              color: ColorConstant.labelTextColor,
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.borderTextFieldColor),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: ColorConstant.primaryWhiteColor),
      ),
    );
  }
}
