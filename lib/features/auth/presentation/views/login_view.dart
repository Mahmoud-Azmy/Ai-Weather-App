import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_field_type.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                var cubit = BlocProvider.of<AuthCubit>(context);
                return SingleChildScrollView(
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
                          style: AppStyles.textStyle14
                              .copyWith(color: Colors.white54),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomTextFormFieldType(
                          text: AppConsts.emailText,
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          validator: (value) => cubit.validateEmail(value),
                        ),
                        CustomTextFormFieldType(
                          text: AppConsts.passwordText,
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          isPassword: true,
                          icon: Icons.lock,
                          validator: (value) => cubit.validatePassword(value),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child:
                              CustomTextButton(text: AppConsts.forgetPassText),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onPressed: () {
                            _submit();
                          },
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      autovalidateMode = AutovalidateMode.always;
      return;
    }
    _formKey.currentState!.save();

    // authController.isLoading.value = true;
  }
}
