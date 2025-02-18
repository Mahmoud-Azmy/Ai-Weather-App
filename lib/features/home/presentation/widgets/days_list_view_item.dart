import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysListViewItem extends StatelessWidget {
  const DaysListViewItem({
    super.key,
    required this.isSelected,
    required this.dayName,
    required this.dayNumber,
  });
  final bool isSelected;
  final String dayName;
  final int dayNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppColors.textFormFiledColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      width: 55.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayName,
            style: AppStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w200,
                color: isSelected ? AppColors.primaryColor : Colors.white),
          ),
          Text(
            '$dayNumber',
            style: AppStyles.textStyle22.copyWith(
                color: isSelected ? AppColors.primaryColor : Colors.white),
          ),
        ],
      ),
    );
  }
}
