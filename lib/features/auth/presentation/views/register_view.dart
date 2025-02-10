import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_field_type.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode loginAutovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
          padding: const EdgeInsets.all(30),
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
                          AppConsts.signUpText,
                          style: AppStyles.textStyle50,
                        ),
                        Text(
                          AppConsts.createAcountText.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle14
                              .copyWith(color: Colors.white54),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextFormFieldType(
                          text: AppConsts.fullNameText,
                        ),
                        CustomTextFormField(
                          controller: nameController,
                          icon: Icons.person_outline_rounded,
                        ),
                        CustomTextFormFieldType(
                          text: AppConsts.emailText,
                        ),
                        CustomTextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.email_outlined,
                            validator: (p0) => cubit.validateEmail(p0)),
                        CustomTextFormFieldType(
                          text: AppConsts.passwordText,
                        ),
                        CustomTextFormField(
                            controller: passwordController,
                            isPassword: true,
                            icon: Icons.lock,
                            validator: (data) => cubit.validatePassword(data)),
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          onPressed: () {
                            _submit();
                          },
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
      loginAutovalidateMode = AutovalidateMode.always;
      return;
    }
    _formKey.currentState!.save();

    // authController.isLoading.value = true;
  }
}
