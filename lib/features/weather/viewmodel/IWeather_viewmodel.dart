import 'package:bloc_weather_app/product/enum/LocationEnum.dart';

abstract class IWeatherViewModel {
  Future<void> fetchWeatherData({LocationName? locationName});
}
