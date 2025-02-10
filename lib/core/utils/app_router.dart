import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:ai_weather_app/features/auth/presentation/views/login_view.dart';
import 'package:ai_weather_app/features/auth/presentation/views/register_view.dart';
import 'package:ai_weather_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String registerView = '/register';
  static const String loginView = '/login';

  static final GoRouter router = GoRouter(
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
            create: (context) => AuthCubit(),
            child: const RegisterView(),
          );
        },
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          );
        },
      ),
    ],
  );
}
