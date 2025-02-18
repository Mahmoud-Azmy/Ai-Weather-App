import 'package:ai_weather_app/core/functions/show_snack_bar.dart';
import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/reset_user_password.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showForgotPasswordDialog(BuildContext context) {
  final emailController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => AuthCubit(
          sl<LoginUserUseCase>(),
          sl<SignUpUserUseCase>(),
          sl<ResetUserPasswordUseCase>(),
          sl<BaseAuthUserRepo>(),
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              Navigator.pop(context);
              authSnackBar(
                  context: context,
                  message: state.message,
                  color: Colors.green);
            }
            if (state is ResetPasswordErrorState) {
              authSnackBar(
                  context: context, message: state.message, color: Colors.red);
            }
          },
          builder: (innerContext, state) {
            return AlertDialog(
              backgroundColor: AppColors.scaffoldBackgroundColor[0],
              title: const Text(AppConsts.forgotPassword),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(AppConsts.forgotPasswordText),
                  SizedBox(height: 10.h),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      labelText: AppConsts.emailText,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(AppConsts.cancel),
                ),
                TextButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    final email = emailController.text.trim();
                    if (email.isNotEmpty) {
                      BlocProvider.of<AuthCubit>(innerContext)
                          .resetUserPassword(
                        UserEntity(email: email, password: '', name: ''),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(AppConsts.enterYourEmail),
                        ),
                      );
                    }
                  },
                  child: state is ResetPasswordLoadingState
                      ? SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(AppConsts.resetPassword),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
