import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/days_list_view_active_item.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/days_list_view_in_active_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysListView extends StatelessWidget {
  const DaysListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.textFormFiledColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 5) {
              return DaysListViewActiveItem(index: index);
            }
            return DaysListViewInactiveItem(
              index: index,
            );
          },
          itemCount: 10),
    );
  }
}
