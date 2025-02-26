import 'package:ai_weather_app/core/theme/app_colors.dart';
import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetPredictionBlocListener extends StatelessWidget {
  const GetPredictionBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherDataCubit, WeatherDataState>(
      listener: (context, state) {
        if (state is TennisPredictionSuccessState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: AppColors.secondaryColor,
                contentPadding: EdgeInsets.all(24.h),
                content: Text(
                  state.prediction == 1
                      ? AppConsts.canPlay
                      : AppConsts.canNotPlay,
                  style: AppStyles.textStyle16,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok'),
                  )
                ],
              );
            },
          );
        }
      },
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        color: AppColors.secondaryColor,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          1,
        ),
        onPressed: () {
          BlocProvider.of<WeatherDataCubit>(context).getTennisPredictionData(
              BlocProvider.of<WeatherDataCubit>(context).weatherList[
                  BlocProvider.of<WeatherDataCubit>(context).selectedIndex]);
        },
        child: Text('Get Predictions'),
      ),
    );
  }
}
