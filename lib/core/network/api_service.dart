import 'dart:convert';

import 'package:dio/dio.dart';

import '../utils/app_consts.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await _dio.get(
        '${AppConsts.baseURL}key=${AppConsts.apiKey}&q=$endPoint&days=3&aqi=no&alerts=no');
    var data = response.data;
    return data;
  }

  Future<int> post(List<int> features) async {
    final response = await _dio.post(
      AppConsts.aiModelBaseURL,
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
      data: json.encode({'features': features}),
    );

    final prediction = response.data['prediction'];
    return prediction[0];
  }
}

//http://api.weatherapi.com/v1/forecast.json?key=eb32de73f3994179a9b53834251602&q=cairo&days=10&aqi=no&alerts=no
