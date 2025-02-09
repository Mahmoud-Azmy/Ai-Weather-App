import 'package:ai_weather_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashBackgroundImage extends StatelessWidget {
  const SplashBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppAssets.splashImage),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
