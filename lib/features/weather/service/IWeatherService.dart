import 'package:bloc_weather_app/features/weather/model/weather_model.dart';
import 'package:bloc_weather_app/product/enum/LocationEnum.dart';

abstract class IWeatherService {
  Future<Weather?> fetchWeather({LocationName? locationName});
}
