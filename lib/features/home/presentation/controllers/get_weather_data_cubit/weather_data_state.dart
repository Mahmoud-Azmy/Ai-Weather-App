part of 'weather_data_cubit.dart';

sealed class WeatherDataState extends Equatable {
  const WeatherDataState();

  @override
  List<Object> get props => [];
}

final class WeatherDataInitial extends WeatherDataState {}

final class ChangeIndexState extends WeatherDataState {}

final class SetIndexState extends WeatherDataState {}

final class WeatherDataLoadingState extends WeatherDataState {}

final class WeatherDataLoadedState extends WeatherDataState {
  final List<WeatherEntity> weatherList;
  const WeatherDataLoadedState({required this.weatherList});
}

final class WeatherDataErrorState extends WeatherDataState {
  final String message;
  const WeatherDataErrorState({required this.message});
}
