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
          Text(
            weatherEntity?.cityName ?? '',
            style: AppStyles.textStyle28,
          ),
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
          SizedBox(height: 30.h),
          weatherDetail("Humidity", "${weatherEntity?.humidity}%"),
          SizedBox(height: 30.h),
          Row(
            spacing: 120.w,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weatherDetail("Wind", "${weatherEntity?.windSpeed} km/h"),
              weatherDetail("UV index", "${weatherEntity?.uv}"),
            ],
          ),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weatherDetail("Sunrise", weatherEntity?.sunrise ?? ''),
              weatherDetail("Sunset", weatherEntity?.sunset ?? ''),
            ],
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
