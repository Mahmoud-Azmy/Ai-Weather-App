import 'package:ai_weather_app/core/theme/app_colors.dart';
import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: AppStyles.textStyle22
                    .copyWith(color: AppColors.primaryColor),
              ),
              Text(
                '${sl<SharedPreferences>().getString('userName')}',
                style:
                    AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w300),
                maxLines: 2,
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.menu,
            size: 40.sp,
          ),
        )
      ],
    );
  }
}
