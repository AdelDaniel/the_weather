import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_weather/model/weather_model.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spin;
import '../Services/weather_app_service.dart';
import 'package:connectivity/connectivity.dart';

class LoadingScreen extends StatelessWidget {
  static const String id = "LoadingScreen";
  @override
  Widget build(BuildContext context) {
    WeatherAppService weatherAppService = WeatherAppService();
    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshotConectivity) {
            print('conectivity check :: ${snapshotConectivity.toString()}');
            if (snapshotConectivity.connectionState != ConnectionState.active) {
              return _internetConnectionError();
            }
            return FutureBuilder<WeatherModel>(
                future: weatherAppService.getWeatherOfCurrentLocation(),
                builder: (ctx, getWeatherSnapshot) {
                  print(getWeatherSnapshot);
                  if (getWeatherSnapshot.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.popAndPushNamed(context, LocationScreen.id,
                          arguments: getWeatherSnapshot.data);
                    });
                  }
                  return Center(
                    child: spin.SpinKitPouringHourglass(
                      color: Colors.white,
                      size: 75.0,
                    ),
                  );
                });
          }),
    );
  }

  Center _internetConnectionError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          spin.SpinKitPouringHourglass(color: Colors.white, size: 75.0),
          SizedBox(height: 15),
          Text(
            "Connection Error!\nCheck Your Ineternet Connection... ",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
