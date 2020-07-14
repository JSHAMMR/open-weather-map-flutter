import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:open_weather_map_flutter/home/models/result.dart';
import 'package:open_weather_map_flutter/home/models/weather.dart';
import 'package:open_weather_map_flutter/home/network/network.dart';
import 'package:open_weather_map_flutter/home/network/utils/request_type.dart';
import 'package:open_weather_map_flutter/home/network/utils/request_type_exception.dart';
import 'package:open_weather_map_flutter/utils/constants.dart';

void main () {
  Network networkClient = Network(Client());
  Result result;
  group('Network Test', () {

    test("Get Weather Test", () async {
      try {

        final response = await networkClient.request(requestType: RequestType.GET,
            path: "/data/2.5/weather?q=London&appid=${Constants().getApiKey()}");
        if (response.statusCode == 200) {
          result =  Result<WeatherAPI>.sucesss(WeatherAPI.fromJson(jsonDecode(response.body)));
        } else {
          result =  Result.error("Weather not available");
        }

      } catch (error){
        result =  Result.error("Something went wrong!");

      }

      WeatherAPI weatherAPI = await ((result as SuccessState).msg as WeatherAPI);
      expect(weatherAPI.id, 2643743);
      expect(weatherAPI.name, "London");
      expect(weatherAPI.cod, 200);


    });

    test("Method Test", () async {
      RequestTypeNotFoundException exError;
      try {

        final response = await networkClient.request(requestType: RequestType.POST,
            path: "/data/2.5/weather?q=London&appid=${Constants().getApiKey()}");
        if (response.statusCode == 200) {
          result =  Result<WeatherAPI>.sucesss(WeatherAPI.fromJson(jsonDecode(response.body)));
        } else {
          result =  Result.error("Weather not available");
        }

      } catch (error){

        exError =  error as RequestTypeNotFoundException;
        result =  Result.error("Something went wrong!");

      }

      expect(exError.cause, "Wrong method");


    });



  });
}