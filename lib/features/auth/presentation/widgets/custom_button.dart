import 'package:ai_weather_app/core/theme/app_colors.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.child,
  });
  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            color: AppColors.customButtonColor,
            height: 65.h,
            minWidth: double.infinity,
            onPressed: onPressed,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          color: AppColors.customButtonColor,
          height: 65.h,
          minWidth: double.infinity,
          onPressed: onPressed,
          child: child,
          // ?? Text(text, style: AppStyles.textStyle22),
        );
      },
    );
  }
}
