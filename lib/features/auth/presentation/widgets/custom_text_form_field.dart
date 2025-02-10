import 'package:ai_weather_app/core/utils/app_colors.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.keyboardType,
    this.icon,
    required this.controller,
    this.onSaved,
    this.validator,
  });

  final bool isPassword;
  final TextInputType? keyboardType;
  final IconData? icon;
  final TextEditingController controller;

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        bool isObscured = isPassword &&
            (state is ChangePasswordVisibility ? !state.isVisible : true);
        return TextFormField(
          keyboardType: keyboardType,
          obscureText: isObscured,
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  top: 18, bottom: 18, left: 20, right: 8),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                  )
                : null,
            fillColor: AppColors.textFormFiledColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 0),
            ),
          ),
        );
      },
    );
  }
}
