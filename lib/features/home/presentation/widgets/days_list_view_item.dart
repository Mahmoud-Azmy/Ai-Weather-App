import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysListViewItem extends StatelessWidget {
  const DaysListViewItem({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppColors.textFormFiledColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      width: 50.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mon",
            style: AppStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w200,
                color: isSelected ? AppColors.primaryColor : Colors.white),
          ),
          Text(
            '4',
            style: AppStyles.textStyle22.copyWith(
                color: isSelected ? AppColors.primaryColor : Colors.white),
          ),
        ],
      ),
    );
  }
}
