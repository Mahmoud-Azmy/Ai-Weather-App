import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldType extends StatelessWidget {
  const CustomTextFormFieldType({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Text(
          text,
          style: AppStyles.textStyle20,
        ),
      ),
    );
  }
}
