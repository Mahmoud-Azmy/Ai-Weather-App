import 'package:intl/intl.dart';

DateTime startDate = DateTime.now();
List<Map<String, dynamic>> forecastDays = List.generate(5, (index) {
  DateTime currentDate = startDate.add(Duration(days: index));
  return {
    "dayName": DateFormat('E').format(currentDate),
    "dayNumber": currentDate.day,
  };
});
