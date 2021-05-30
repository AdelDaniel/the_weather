import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_weather/screens/cubit_test_screen.dart';
import '../model/weather_model.dart';
import 'geolocator_test_screen.dart';
import 'location_screen.dart';
import '../services/weather_app_service.dart';

class CityScreen extends StatelessWidget {
  static const String id = "CityScreen";

  final StreamController<String> streamController = StreamController<String>();
  final TextEditingController textEditingController = TextEditingController();
  // final TextEditingController textEditingController =Text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context, null),
                        child: Icon(Icons.arrow_back_ios, size: 50.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, CubitTestScreen.id),
                        child: Icon(Icons.local_airport, size: 50.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, GeolocatorTestScreen.id),
                        child: Icon(Icons.location_pin, size: 50.0),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: StreamBuilder<String>(
                      stream: streamController.stream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: textEditingController,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                              errorText: snapshot.error,
                              filled: true,
                              fillColor: Colors.black12,
                              hintText: 'Enter the City Name',
                              icon: Icon(
                                Icons.location_city,
                                size: 30.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              )),
                          onChanged: (String value) {
                            streamController.sink.add(value);
                          },
                        );
                      }),
                ),
                TextButton(
                  onPressed: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if (connectivityResult == ConnectivityResult.none) {
                      streamController.sink
                          .addError("Oops! check Your internet connection");
                    } else {
                      print('city Name :: ' + textEditingController.text);
                      if (textEditingController.text.isEmpty) {
                        streamController.sink.addError("Enter City Name!");
                      } else {
                        WeatherAppService weatherAppService =
                            WeatherAppService();
                        WeatherModel wm;
                        try {
                          wm = await weatherAppService
                              .getWeatherByCityName(textEditingController.text);
                          if (wm == null) {
                            streamController.sink
                                .addError('No country with that name!');
                          } else
                            Navigator.pushNamed(context, LocationScreen.id,
                                arguments: wm);
                        } catch (e) {
                          streamController.sink
                              .addError('Oops.. Something went Wrong!');
                        }
                      }
                    }
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dispos() {
    streamController.close();
  }
}
