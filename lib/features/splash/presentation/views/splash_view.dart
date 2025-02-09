import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/core/widgets/custom_material_button.dart';
import 'package:ai_weather_app/features/splash/presentation/widgets/custom_linear_gradient.dart';
import 'package:ai_weather_app/features/splash/presentation/widgets/splash_background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToRegisterView();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SplashBackgroundImage(),
          CustomLinearGradient(),
          Positioned(
            bottom: 40,
            right: 20,
            child: CustomMaterialButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.registerView);
              },
              text: AppConsts.skipButton,
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Know the \nWeather Status',
                      style: AppStyles.textStyle40),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<Offset>(
      begin: const Offset(1.5, 3),
      end: const Offset(0, 3),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  void navigateToRegisterView() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (mounted) {
          GoRouter.of(context).pushReplacement(AppRouter.registerView);
        }
      },
    );
  }
}
