import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.textFormFiledColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              textAlign: TextAlign.start,
              style: AppStyles.textStyle22.copyWith(color: Colors.white),
            ),
            Divider(color: Colors.white),
            TextButton(
              child: Text('Logout',
                  textAlign: TextAlign.start,
                  style: AppStyles.textStyle20.copyWith(color: Colors.white)),
              onPressed: () {
                sl<SharedPreferences>().remove(AppConsts.kToken);
                sl<SharedPreferences>().remove('userName');
                GoRouter.of(context).go(AppRouter.splashView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
