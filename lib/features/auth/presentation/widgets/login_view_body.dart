import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/core/utils/validators.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_field_type.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/login_button_bloc_consumer.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/show_forget_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  style: AppStyles.textStyle14.copyWith(color: Colors.white54),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormFieldType(
                  text: AppConsts.emailText,
                ),
                CustomTextFormField(
                  onChanged: (p0) {
                    emailController.text = p0 ?? '';
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  validator: (value) => Validators.validateEmail(value),
                ),
                CustomTextFormFieldType(
                  text: AppConsts.passwordText,
                ),
                CustomTextFormField(
                  onChanged: (p0) {
                    passwordController.text = p0 ?? '';
                  },
                  controller: passwordController,
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (value) => Validators.validatePassword(value),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CustomTextButton(
                    text: AppConsts.forgetPassText,
                    onPressed: () {
                      showForgotPasswordDialog(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                LoginButtonBlocConsumer(
                    formKey: _formKey,
                    emailController: emailController,
                    passwordController: passwordController),
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
    );
  }
}
