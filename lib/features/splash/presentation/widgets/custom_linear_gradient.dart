import 'package:flutter/material.dart';

class CustomLinearGradient extends StatelessWidget {
  const CustomLinearGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
            Colors.black,
          ],
          stops: const [0.3, 0.5, .9],
        ),
      ),
    );
  }
}
