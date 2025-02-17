import 'package:ai_weather_app/features/home/presentation/controllers/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/days_list_view.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/home_view_appbar.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/weather_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: BlocBuilder<WeatherDataCubit, WeatherDataState>(
            builder: (context, state) {
              return Column(
                children: [
                  HomeViewAppBar(),
                  SizedBox(height: 30.h),
                  DaysListView(),
                  SizedBox(height: 30.h),
                  if (state is WeatherDataLoadingState)
                    WeatherDetailsSection(
                      isLoading: true,
                    ),
                  if (state is WeatherDataLoadedState)
                    WeatherDetailsSection(
                        weatherEntity: state.weatherList[7], isLoading: false),
                  if (state is WeatherDataErrorState)
                    Center(
                      child: Text(state.message),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
