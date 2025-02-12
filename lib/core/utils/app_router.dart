import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:ai_weather_app/features/auth/presentation/views/login_view.dart';
import 'package:ai_weather_app/features/auth/presentation/views/register_view.dart';
import 'package:ai_weather_app/features/splash/presentation/views/splash_view.dart';
import 'package:ai_weather_app/home_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String registerView = '/register';
  static const String loginView = '/login';
  static const String testHomeView = '/testHome';

  static GoRouter router(String initialRoute) {
    return GoRouter(
      initialLocation: initialRoute, // Set the initial route dynamically
      routes: [
        GoRoute(
          path: splashView,
          builder: (context, state) {
            return const SplashView();
          },
        ),
        GoRoute(
          path: registerView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => AuthCubit(
                sl<LoginUserUseCase>(),
                sl<SignUpUserUseCase>(),
                null,
              ),
              child: const RegisterView(),
            );
          },
        ),
        GoRoute(
          path: loginView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => AuthCubit(
                sl<LoginUserUseCase>(),
                sl<SignUpUserUseCase>(),
                null,
              ),
              child: const LoginView(),
            );
          },
        ),
        GoRoute(
          path: testHomeView,
          builder: (context, state) {
            return const HomeTest();
          },
        ),
      ],
    );
  }
}
