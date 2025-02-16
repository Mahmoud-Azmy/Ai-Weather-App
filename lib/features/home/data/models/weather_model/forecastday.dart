import 'dart:convert';

import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  factory Forecastday.fromMap(Map<String, dynamic> data) => Forecastday(
        date: data['date'] as String?,
        dateEpoch: data['date_epoch'] as int?,
        day: data['day'] == null
            ? null
            : Day.fromMap(data['day'] as Map<String, dynamic>),
        astro: data['astro'] == null
            ? null
            : Astro.fromMap(data['astro'] as Map<String, dynamic>),
        hour: (data['hour'] as List<dynamic>?)
            ?.map((e) => Hour.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'date': date,
        'date_epoch': dateEpoch,
        'day': day?.toMap(),
        'astro': astro?.toMap(),
        'hour': hour?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Forecastday].
  factory Forecastday.fromJson(String data) {
    return Forecastday.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Forecastday] to a JSON string.
  String toJson() => json.encode(toMap());
}
