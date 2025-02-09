import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const textStyle18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const textStyle22 = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: AppConsts.kPilatExtended);
  static const textStyle20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const textStyle40 = TextStyle(
    fontSize: 40,
    fontFamily: AppConsts.kPilatExtended,
    fontWeight: FontWeight.w500,
  );
  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const textStyle16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}
