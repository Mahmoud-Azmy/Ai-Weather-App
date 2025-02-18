import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_state.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/days_list_view.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/home_view_appbar.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/weather_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          child: BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state.status == 'loading') {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 300.h),
                      Text('Fetching Your location...',
                          style: AppStyles.textStyle18),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (state.status != 'success') {
                return Center(
                  child: Text(
                    state.status,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.red,
                    ),
                  ),
                );
              }
              return BlocBuilder<WeatherDataCubit, WeatherDataState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      HomeViewAppBar(),
                      SizedBox(height: 30.h),
                      DaysListView(),
                      SizedBox(height: 30.h),
                      Text(
                        BlocProvider.of<LocationCubit>(context).state.country,
                        style: AppStyles.textStyle28,
                      ),
                      Text(
                        BlocProvider.of<LocationCubit>(context).state.city,
                        style: AppStyles.textStyle18,
                      ),
                      if (state is WeatherDataLoadingState)
                        WeatherDetailsSection(
                          isLoading: true,
                        ),
                      if (state is WeatherDataLoadedState)
                        WeatherDetailsSection(
                          weatherEntity: state.weatherList[
                              BlocProvider.of<WeatherDataCubit>(context)
                                  .selectedIndex],
                          isLoading: false,
                        ),
                      if (state is WeatherDataErrorState)
                        Center(
                          child: Text(state.message),
                        ),
                      ElevatedButton(
                        child: Text('Logout', style: TextStyle(fontSize: 40)),
                        onPressed: () {
                          sl<SharedPreferences>().remove(AppConsts.kToken);
                          sl<SharedPreferences>().remove('userName');
                          GoRouter.of(context).go(AppRouter.splashView);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
