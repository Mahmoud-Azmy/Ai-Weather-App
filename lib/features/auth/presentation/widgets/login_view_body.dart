import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/core/utils/validators.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_field_type.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
                height: 40,
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
                child: CustomTextButton(text: AppConsts.forgetPassText),
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state is LoginSuccessState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.testHomeView);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () async {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) {
                        autovalidateMode = AutovalidateMode.always;
                        return;
                      }
                      _formKey.currentState!.save();
                      BlocProvider.of<AuthCubit>(context).loginUser(
                        UserEntity(
                          email: emailController.text,
                          password: passwordController.text,
                          name: '',
                        ),
                      );
                    },
                    child: state is LoginLoadingState
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(AppConsts.signInText,
                            style: AppStyles.textStyle22),
                  );
                },
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
      )),
    );
  }
}
