import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) {
        if (didPop) {
          return;
        }
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.scaffoldBackgroundColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Home',
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Logout', style: TextStyle(fontSize: 40)),
                  onPressed: () {
                    sl<SharedPreferences>().remove(AppConsts.kToken);
                    GoRouter.of(context).go(AppRouter.splashView);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
