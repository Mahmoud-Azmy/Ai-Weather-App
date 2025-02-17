import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressIndicatorChart extends StatelessWidget {
  final double value;

  const CircularProgressIndicatorChart({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80.w,
              height: 80.h,
              child: CircularProgressIndicator(
                value: value / 100,
                strokeWidth: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Text(
              "${value.toInt()}%",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Humidity",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
