import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style:
                  AppStyles.textStyle22.copyWith(color: AppColors.primaryColor),
            ),
            Text('Mahmoud Azmy',
                style: AppStyles.textStyle18
                    .copyWith(fontWeight: FontWeight.w300)),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 40.sp,
          ),
        )
      ],
    );
  }
}
