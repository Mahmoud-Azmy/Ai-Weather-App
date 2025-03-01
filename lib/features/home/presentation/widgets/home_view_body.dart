import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/days_list_view.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/get_prediction_bloc_listener.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/home_view_appbar.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/weather_details_section_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            children: [
              HomeViewAppBar(
                onPressed: onPressed,
              ),
              SizedBox(height: 30.h),
              DaysListView(),
              SizedBox(height: 30.h),
              Text(
                sl<SharedPreferences>().getString(AppConsts.kCountry)!,
                style: AppStyles.textStyle28,
              ),
              Text(
                sl<SharedPreferences>().getString(AppConsts.kCity)!,
                style: AppStyles.textStyle18,
                textAlign: TextAlign.center,
              ),
              WeatherDetailsSectionBlocBuilder(),
              SizedBox(height: 30.h),
              GetPredictionBlocListener(),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
