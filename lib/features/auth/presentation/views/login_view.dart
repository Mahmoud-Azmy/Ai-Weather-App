import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_field_type.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          padding: const EdgeInsets.all(24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConsts.signInText,
                    style: AppStyles.textStyle50,
                  ),
                  Text(
                    AppConsts.loginToAcountText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style:
                        AppStyles.textStyle14.copyWith(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 40,
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
                  CustomTextFormField(
                    isPassword: true,
                    icon: Icons.lock,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomTextButton(text: AppConsts.forgetPassText),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: AppConsts.signInText,
                  ),
                  CustomTextButton(
                    text: AppConsts.notHaveAnAcountText,
                    onPressed: () {
                      GoRouter.of(context).pop();
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
