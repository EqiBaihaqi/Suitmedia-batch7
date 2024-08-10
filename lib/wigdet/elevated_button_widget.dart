import 'package:flutter/material.dart';
import 'package:suitmedia_batch7/constant/color_constant.dart';
import 'package:suitmedia_batch7/constant/text_style_constant.dart';

class ElevatedButtonCustomWidget extends StatelessWidget {
  final String label;
  final Function onPressed;
  const ElevatedButtonCustomWidget(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 310,
        height: 41,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: ColorConstant.buttonColor),
          child: Text(
            label,
            style: TextStyleConstant.poppins500.copyWith(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 14,
            ),
          ),
        ));
  }
}
