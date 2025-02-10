import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_field_type.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.authBackgroundColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConsts.signUpText,
                    style: AppStyles.textStyle50,
                  ),
                  Text(
                    AppConsts.createAcountText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style:
                        AppStyles.textStyle14.copyWith(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormFieldType(
                    text: AppConsts.fullNameText,
                  ),
                  CustomTextFormField(
                    icon: Icons.person_outline_rounded,
                  ),
                  CustomTextFormFieldType(
                    text: AppConsts.emailText,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                  ),
                  CustomTextFormFieldType(
                    text: AppConsts.passwordText,
                  ),
                  CustomTextFormField(isPassword: true, icon: Icons.lock),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: AppConsts.signUpText,
                  ),
                  CustomTextButton(
                    text: AppConsts.haveAnAcountText,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.loginView);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
