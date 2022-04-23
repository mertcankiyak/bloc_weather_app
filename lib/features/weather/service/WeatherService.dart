import 'package:bloc_weather_app/features/weather/model/weather_model.dart';
import 'package:bloc_weather_app/features/weather/service/IWeatherService.dart';
import 'package:bloc_weather_app/product/constants/AppConstants.dart';
import 'package:bloc_weather_app/product/enum/LocationEnum.dart';
import 'package:bloc_weather_app/product/enum/ServiceEnum.dart';
import 'package:bloc_weather_app/product/extensions/LocationExtensions.dart';
import 'package:bloc_weather_app/product/extensions/ServiceExtensions.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class WeatherService extends IWeatherService {
  final NetworkManager _networkManager = NetworkManager(
      options: BaseOptions(baseUrl: "https://api.weatherapi.com"));

  @override
  Future<Weather?> fetchWeather({LocationName? locationName}) async {
    try {
      final response = await _networkManager.send<Weather, Weather>(
          ServicePath.CURRENT.rawValue +
              apiKey +
              "&q=" +
              locationName!.rawValue,
          parseModel: Weather(),
          method: RequestType.GET);
      return response.data;
    } catch (e) {
      //Error
    }
  }
}
