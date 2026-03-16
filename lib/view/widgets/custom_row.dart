import 'package:bmi_calculator/constants/app_color.dart';
import 'package:bmi_calculator/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          size: 16,
          fontWeight: FontWeight.w400,
          color: AppColors().textColor,
        ),
      ],
    );
  }
}
