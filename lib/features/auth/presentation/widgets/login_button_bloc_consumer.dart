import 'package:ai_weather_app/core/functions/show_snack_bar.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/app_styles.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:ai_weather_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          authSnackBar(
              context: context, message: state.message, color: Colors.red);
        }
        if (state is LoginSuccessState) {
          authSnackBar(
              context: context, message: state.message, color: Colors.green);
          GoRouter.of(context).pushReplacement(AppRouter.testHomeView);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () async {
            final isValid = _formKey.currentState!.validate();
            if (!isValid) {
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
              : Text(AppConsts.signInText, style: AppStyles.textStyle22),
        );
      },
    );
  }
}
