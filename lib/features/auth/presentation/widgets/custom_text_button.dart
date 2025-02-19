import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Opacity(
          opacity: .8,
          child: Text(
            text,
            style: AppStyles.textStyle14
                .copyWith(color: const Color.fromARGB(255, 54, 145, 220)),
          ),
        ),
      ),
    );
  }
}
