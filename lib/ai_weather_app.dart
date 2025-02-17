import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiWeatherApp extends StatelessWidget {
  const AiWeatherApp({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppConsts.appName,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor[1],
        ),
        routerConfig: AppRouter.router(initialRoute),
      ),
    );
  }
}
