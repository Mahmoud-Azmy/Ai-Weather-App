import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/weather_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeatherDetailsSection extends StatelessWidget {
  const WeatherDetailsSection(
      {super.key, this.weatherEntity, required this.isLoading});
  final WeatherEntity? weatherEntity;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Text(
            weatherEntity?.responseDate ?? '',
            style: AppStyles.textStyle12.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 10.h),
          Text(
            "${weatherEntity?.temp} C°",
            style: AppStyles.textStyle50,
          ),
          // SizedBox(height: 10.h),
          Text(
            weatherEntity?.description ?? '',
            style: AppStyles.textStyle14.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          weatherDetail(AppConsts.humidity, "${weatherEntity?.humidity}%"),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weatherDetail(AppConsts.wind, "${weatherEntity?.windSpeed} km/h"),
              Spacer(),
              weatherDetail(AppConsts.uv, "${weatherEntity?.uv}"),
            ],
          ),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weatherDetail(AppConsts.sunrise, weatherEntity?.sunrise ?? ''),
              weatherDetail(AppConsts.sunset, weatherEntity?.sunset ?? ''),
            ],
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
