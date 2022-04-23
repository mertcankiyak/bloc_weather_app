import 'package:bloc_weather_app/product/enum/LocationEnum.dart';

extension LocationExtensions on LocationName {
  String get rawValue {
    switch (this) {
      case LocationName.ATINA:
        return "Atina";
      case LocationName.PARIS:
        return "Paris";
      case LocationName.NAIROBI:
        return "Nairobi";
      default:
        return "Atina";
    }
  }
}
