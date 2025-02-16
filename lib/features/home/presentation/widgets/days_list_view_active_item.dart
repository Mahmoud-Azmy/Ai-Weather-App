import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysListViewActiveItem extends StatelessWidget {
  const DaysListViewActiveItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      width: 50.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mon",
            style: AppStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w200, color: AppColors.primaryColor),
          ),
          Text(
            (index + 1).toString(),
            style:
                AppStyles.textStyle22.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
