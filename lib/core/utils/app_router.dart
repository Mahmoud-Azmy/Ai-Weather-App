import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:ai_weather_app/features/auth/presentation/views/login_view.dart';
import 'package:ai_weather_app/features/auth/presentation/views/register_view.dart';
import 'package:ai_weather_app/features/home/domain/use_cases/get_tennis_prediction_use_case.dart';
import 'package:ai_weather_app/features/home/domain/use_cases/get_weather_data_use_case.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/views/get_location_view.dart';
import 'package:ai_weather_app/features/home/presentation/views/home_view.dart';
import 'package:ai_weather_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppRouter {
  static const String onBoarding = '/';
  static const String registerView = '/register';
  static const String loginView = '/login';
  static const String homeView = '/home';
  static const String getLocation = '/getLocation';

  static GoRouter router(String initialRoute) {
    return GoRouter(
      initialLocation: initialRoute, // Set the initial route dynamically
      routes: [
        GoRoute(
          path: onBoarding,
          builder: (context, state) => const OnBoardingView(),
        ),
        GoRoute(
          path: getLocation,
          builder: (context, state) => BlocProvider(
            create: (context) => LocationCubit()..fetchLocation(),
            child: const GetLocationView(),
          ),
        ),
        GoRoute(
          path: registerView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => AuthCubit(sl<LoginUserUseCase>(),
                  sl<SignUpUserUseCase>(), null, sl<BaseAuthUserRepo>()),
              child: const RegisterView(),
            );
          },
        ),
        GoRoute(
          path: loginView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => AuthCubit(sl<LoginUserUseCase>(),
                  sl<SignUpUserUseCase>(), null, sl<BaseAuthUserRepo>()),
              child: const LoginView(),
            );
          },
        ),
        GoRoute(
          path: homeView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => WeatherDataCubit(
                sl.get<GetWeatherDataUseCase>(),
                sl.get<GetTennisPredictionUseCase>(),
              )..getWeatherData(
                  '${sl<SharedPreferences>().getString(AppConsts.kLat)},${sl<SharedPreferences>().getString(AppConsts.kLong)}',
                ),
              child: HomeView(),
            );
          },
        ),
      ],
    );
  }
}
