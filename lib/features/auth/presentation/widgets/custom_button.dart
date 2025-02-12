import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              borderRadius: BorderRadius.circular(30),
            ),
            color: AppColors.customButtonColor,
            height: 65,
            minWidth: double.infinity,
            onPressed: onPressed,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: AppColors.customButtonColor,
          height: 65,
          minWidth: double.infinity,
          onPressed: onPressed,
          child: child,
          // ?? Text(text, style: AppStyles.textStyle22),
        );
      },
    );
  }
}
