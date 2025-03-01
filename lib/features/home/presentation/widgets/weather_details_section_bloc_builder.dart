import 'package:ai_weather_app/features/home/presentation/controllers/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/widgets/weather_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDetailsSectionBlocBuilder extends StatelessWidget {
  const WeatherDetailsSectionBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDataCubit, WeatherDataState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is WeatherDataLoadingState)
              WeatherDetailsSection(
                isLoading: true,
              ),
            if (context.read<WeatherDataCubit>().weatherList.isNotEmpty)
              WeatherDetailsSection(
                weatherEntity: context.read<WeatherDataCubit>().weatherList[
                    context.read<WeatherDataCubit>().selectedIndex],
                isLoading: false,
              ),
            if (state is WeatherDataErrorState)
              Center(
                child: Text(state.message),
              ),
          ],
        );
      },
    );
  }
}
