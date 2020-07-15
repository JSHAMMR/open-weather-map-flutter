import 'package:flutter_test/flutter_test.dart';
import 'package:open_weather_map_flutter/home/models/result.dart';
import 'package:open_weather_map_flutter/home/models/weather.dart';
import 'package:open_weather_map_flutter/home/view_model/view_model.dart';

void main () {

  WeatherViewModel vm = WeatherViewModel();

    test("View Model Test", () async{
     final weatherData = await vm.getWeather("London");

     WeatherAPI weatherAPI = await ((weatherData as SuccessState).msg as WeatherAPI);
     expect(weatherAPI.id, 2643743);
     expect(weatherAPI.name, "London");
     expect(weatherAPI.cod, 200);
    });



}