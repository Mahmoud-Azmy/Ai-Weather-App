import 'package:ai_weather_app/ai_weather_app.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/my_bloc_observer.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  Bloc.observer = MyBlocObserver();
  final token = sl<SharedPreferences>().getString(AppConsts.kToken);
  final initialRoute = token != null && token.isNotEmpty
      ? AppRouter.testHomeView
      : AppRouter.splashView;
  runApp(DevicePreview(
      enabled: true,
      builder: (context) {
        return AiWeatherApp(
          initialRoute: initialRoute,
        );
      }));
}
