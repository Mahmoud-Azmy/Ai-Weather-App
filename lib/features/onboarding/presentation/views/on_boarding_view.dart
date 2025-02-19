import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_cubit.dart';
import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_state.dart';
import 'package:ai_weather_app/features/onboarding/presentation/widgets/custom_material_button.dart';
import 'package:ai_weather_app/features/onboarding/presentation/widgets/on_boarding_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
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
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              OnBoardingBackgroundImage(),
              // CustomLinearGradient(),
              Positioned(
                bottom: 40.h,
                right: 20.w,
                child: CustomMaterialButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.registerView);
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
                      padding: EdgeInsets.only(left: 24.w, top: 10.h),
                      child: Text(AppConsts.knowTheWeatherText,
                          style: AppStyles.textStyle40),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void initSlidingAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<Offset>(
      begin: Offset(1.5.w, 3.h),
      end: Offset(0.w, 2.5.h),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  void navigateToRegisterView() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (mounted) {
          GoRouter.of(context).pushReplacement(AppRouter.registerView);
        }
      },
    );
  }
}
