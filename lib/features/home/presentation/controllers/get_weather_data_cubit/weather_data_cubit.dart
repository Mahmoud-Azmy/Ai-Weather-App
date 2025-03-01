import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather_app/features/home/domain/use_cases/get_tennis_prediction_use_case.dart';
import 'package:ai_weather_app/features/home/domain/use_cases/get_weather_data_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit(this.getWeatherDataUseCas, this.getTennisPredictionUseCase)
      : super(WeatherDataInitial());
  final GetWeatherDataUseCase getWeatherDataUseCas;
  final GetTennisPredictionUseCase getTennisPredictionUseCase;
  bool isLoading = false;
  List weatherList = [];
  int selectedIndex = 0;

  Future<void> getWeatherData(String city) async {
    emit(WeatherDataLoadingState());
    var result = await getWeatherDataUseCas.call(city: city);
    result.fold(
      (failure) {
        emit(
          WeatherDataErrorState(message: failure.errorMessage),
        );
      },
      (weatherData) {
        emit(
          WeatherDataLoadedState(weatherList: weatherData),
        );
        weatherList = weatherData;
      },
    );
    isLoading = false;
  }

  Future<void> getTennisPredictionData(WeatherEntity weather) async {
    emit(TennisPredictionLoadingState());
    var result = await getTennisPredictionUseCase.call(weather);
    result.fold(
      (failure) {
        emit(
          TennisPredictionErrorState(message: failure.errorMessage),
        );
      },
      (prediction) {
        emit(
          TennisPredictionSuccessState(prediction: prediction),
        );
      },
    );
  }

  void setSelectedIndex(int index) {
    selectedIndex = index; // Always update the index
    emit(SetIndexState(selectedIndex: index)); // Emit state with the index
  }
}
