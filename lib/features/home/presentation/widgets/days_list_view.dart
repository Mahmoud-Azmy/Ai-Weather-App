import 'package:ai_weather_app/core/functions/get_day_name_and_number.dart';
import 'package:ai_weather_app/core/theme/app_colors.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/days_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysListView extends StatelessWidget {
  const DaysListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDataCubit, WeatherDataState>(
      builder: (context, state) {
        int selectedIndex =
            context.read<WeatherDataCubit>().selectedIndex; // Default
        return Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<WeatherDataCubit>().setSelectedIndex(index);
                },
                child: DaysListViewItem(
                  dayName: forecastDays[index]['dayName'],
                  dayNumber: forecastDays[index]['dayNumber'],
                  isSelected: index == selectedIndex,
                ),
              );
            },
            itemCount: 3,
          ),
        );
      },
    );
  }
}
