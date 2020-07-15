import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_weather_map_flutter/home/models/result.dart';
import 'package:open_weather_map_flutter/home/models/weather.dart';
import 'package:open_weather_map_flutter/home/network/network.dart';
import 'package:open_weather_map_flutter/home/network/utils/request_type.dart';
import 'package:open_weather_map_flutter/utils/constants.dart';

class WeatherViewModel {
  WeatherViewModel._privateConstructor();
  static final WeatherViewModel _apiResponse = WeatherViewModel._privateConstructor();
  factory WeatherViewModel() =>_apiResponse;
  Network networkClient = Network(Client());

  Future<Result> getWeather(String city) async{
    try {

      final response = await networkClient.request(requestType: RequestType.GET,
          path: "/data/2.5/weather?q=$city&appid=${Constants().getApiKey()}");
      if (response.statusCode == 200) {
        return Result<WeatherAPI>.sucesss(WeatherAPI.fromJson(jsonDecode(response.body)));
      } else {
        return Result.error("Weather not available");
      }

    } catch (error){
      return Result.error("Something went wrong!");

    }
  }
}