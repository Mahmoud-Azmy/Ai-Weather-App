import 'package:ai_weather_app/core/theme/app_colors.dart';
import 'package:ai_weather_app/features/auth/presentation/controllers/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.keyboardType,
    this.icon,
    required this.controller,
    this.onChanged,
    this.validator,
  });

  final bool isPassword;
  final TextInputType? keyboardType;
  final IconData? icon;
  final TextEditingController controller;

  final void Function(String?)? onChanged;
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
          onSaved: onChanged,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  top: 18.h, bottom: 18.h, left: 20.w, right: 8.w),
              child: Icon(
                icon,
                size: 30.sp,
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
            fillColor: AppColors.secondaryColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(width: 0),
            ),
          ),
        );
      },
    );
  }
}
