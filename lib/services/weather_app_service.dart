import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_weather/services/geoLocator_service.dart';
import '../model/weather_model.dart';
import 'api_network.dart';

import '../model/location_model.dart';

class WeatherAppService {
  // var weatherData;

  LocationModel locationModel;

  Future<WeatherModel> getWeatherOfCurrentLocation() async {
    print('object0');
    // to get location the current location
    try {
      print(locationModel);
      locationModel = await GeoLocatorService().getLatLog();
      print(locationModel);
    } catch (e) {
      print('e');
      print(e.toString());
      throw e.toString();
    }

    print('object');
    ///////after getting long & lat /// then we need to get weather data

    final response = await http.get(
      API.getWeatherByLatLonUri(
          latitude: locationModel.latitude, longitude: locationModel.longitude),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(map);
      print(map);
      return weatherModel;
    }
    print(
        'Request failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  // get weather depending on city name
  Future<dynamic> getWeatherByCityName(String cityName) async {
    //

    final response = await http.get(API.getWeatherByCityUri(cityName));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(map);
      print(map);
      return weatherModel;
    }
    print(
        'Request failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
