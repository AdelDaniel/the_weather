import 'package:flutter/foundation.dart';
import 'api_keys.dart';

/// app key from the site of 'https://home.openweathermap.org/api_keys'

class API {
  static final String _host = 'api.openweathermap.org';

  static Uri getWeatherByLatLonUri(
          {@required double latitude, @required double longitude}) =>
      Uri(
        scheme: 'https',
        host: _host,
        path: 'data/2.5/weather',
        queryParameters: {
          'lat': '$latitude',
          'lon': '$longitude',
          'units': 'metric',
          'appid': AppKey.appKey,
        },
      );

  static Uri getWeatherByCityUri(String cityName) => Uri(
        scheme: 'https',
        host: _host,
        path: 'data/2.5/weather',
        queryParameters: {
          'q': cityName,
          'units': 'metric',
          'appid': AppKey.appKey,
        },
      );
}
