import 'package:ai_weather_app/features/auth/presentation/views/register_view.dart';
import 'package:ai_weather_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String registerView = '/register';

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
          return const RegisterView();
        },
      ),
    ],
  );
}
