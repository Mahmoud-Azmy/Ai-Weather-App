import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetLocationView extends StatelessWidget {
  const GetLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state.status == 'success') {
            GoRouter.of(context).pushReplacement(AppRouter.homeView);
          }
        },
        builder: (context, state) {
          if (state.status == 'loading') {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppConsts.loading, style: AppStyles.textStyle18),
                  SizedBox(height: 10.h),
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
          return SizedBox.shrink();
        },
      ),
    );
  }
}
