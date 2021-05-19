import 'package:flutter/material.dart';
import 'route_generator.dart';
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
      initialRoute: LoadingScreen.id,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      // routes: {
      //   LoadingScreen.id: (context) => LoadingScreen(),
      //   LocationScreen.id: (context) => LocationScreen(),
      //   CityScreen.id: (context) => CityScreen(),
      //   GeolocatorTestScreen.id: (context) => GeolocatorTestScreen(),
      //   CubitTestScreen.id: (context) => CubitTestScreen()
      // },
    );
  }
}
