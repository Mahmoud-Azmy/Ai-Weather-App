import 'package:ai_weather_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class OnBoardingBackgroundImage extends StatelessWidget {
  const OnBoardingBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.splashBackgroundImage),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
