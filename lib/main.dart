import 'package:flutter/material.dart';

import 'screens/city_screen.dart';
import 'screens/geolocator_test_screen.dart';
import 'screens/location_screen.dart';
import 'screens/loading_screen.dart';

void main() => runApp(TheWeatherRootWiget());

class TheWeatherRootWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(bodyText1: TextStyle(fontSize: 100.0))),
      home: LoadingScreen(),
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        LocationScreen.id: (context) => LocationScreen(),
        CityScreen.id: (context) => CityScreen(),
        GeolocatorTestScreen.id: (context) => GeolocatorTestScreen()
      },
    );
  }
}
