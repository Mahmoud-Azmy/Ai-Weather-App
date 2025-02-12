import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class AiWeatherApp extends StatelessWidget {
  const AiWeatherApp({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConsts.appName,
      theme: ThemeData.dark(),
      routerConfig: AppRouter.router(initialRoute),
    );
  }
}
