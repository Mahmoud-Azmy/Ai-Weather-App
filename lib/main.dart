import 'package:ai_weather_app/ai_weather_app.dart';
import 'package:ai_weather_app/core/utils/my_bloc_observer.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const AiWeatherApp());
}
