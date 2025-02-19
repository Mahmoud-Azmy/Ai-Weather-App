import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50.h,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 40.w),
        child: Text(
          text,
          style: AppStyles.textStyle22.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
