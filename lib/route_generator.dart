import 'package:flutter/material.dart';

import 'screens/cubit_test_screen.dart';
import 'screens/city_screen.dart';
import 'screens/geolocator_test_screen.dart';
import 'screens/location_screen.dart';
import 'screens/loading_screen.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case LoadingScreen.id:
        return MaterialPageRoute(builder: (ctx) => LoadingScreen());
        break;
      case LocationScreen.id:
        return MaterialPageRoute(
            builder: (ctx) => LocationScreen(weatherModel: arguments));
        break;
      case CityScreen.id:
        return MaterialPageRoute(builder: (ctx) => CityScreen());
        break;
      case GeolocatorTestScreen.id:
        return MaterialPageRoute(builder: (ctx) => GeolocatorTestScreen());
        break;
      case CubitTestScreen.id:
        return MaterialPageRoute(builder: (ctx) => CubitTestScreen());
        break;
      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(
        builder: (ctx) => Scaffold(
              body: Center(
                child: Text("Oops! \n SomeThing went Wrong",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red)),
              ),
            ));
  }
}
