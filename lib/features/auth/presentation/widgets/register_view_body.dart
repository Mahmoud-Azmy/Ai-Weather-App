import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/theme/app_styles.dart';
import 'package:ai_weather_app/core/utils/validators.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_field_type.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/register_bitton_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  style: AppStyles.textStyle14.copyWith(color: Colors.white54),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextFormFieldType(
                  text: AppConsts.fullNameText,
                ),
                CustomTextFormField(
                  onChanged: (p0) {
                    nameController.text = p0 ?? "";
                  },
                  controller: nameController,
                  icon: Icons.person_outline_rounded,
                  validator: (data) => Validators.validateUsername(data),
                ),
                CustomTextFormFieldType(
                  text: AppConsts.emailText,
                ),
                CustomTextFormField(
                    onChanged: (p0) {
                      emailController.text = p0 ?? "";
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    validator: (data) => Validators.validateEmail(data)),
                CustomTextFormFieldType(
                  text: AppConsts.passwordText,
                ),
                CustomTextFormField(
                    onChanged: (p0) {
                      passwordController.text = p0 ?? "";
                    },
                    controller: passwordController,
                    isPassword: true,
                    icon: Icons.lock,
                    validator: (data) => Validators.validatePassword(data)),
                SizedBox(
                  height: 40.h,
                ),
                RegisterButtonBlocConsumer(
                    formKey: _formKey,
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController),
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
    );
  }
}
