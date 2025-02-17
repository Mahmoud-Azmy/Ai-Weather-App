import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget weatherDetail(String label, String value) {
  return Column(
    children: [
      Text(
        label,
        style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 5.h),
      Text(
        value,
        style: AppStyles.textStyle14,
      ),
    ],
  );
}
