import 'package:flutter/material.dart';
import 'package:the_weather/screens/loading_screen.dart';
import '../mixins_utiliates/icon_and_messege.dart';
import '../model/weather_model.dart';
// import 'package:bmi_calculator/clima/Utiliates/constants.dart';

import 'city_screen.dart';

class LocationScreen extends StatelessWidget with IconAndMessege {
  static const String id = "LocationScreen";
  final WeatherModel weatherModel;

  const LocationScreen({Key key, this.weatherModel}) : super(key: key);

  //to deal with states and data comes from nevigators

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context).settings.arguments as WeatherModel;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, LoadingScreen.id),
                    child: Icon(
                      Icons.refresh,
                      size: 50.0,
                      color: IconTheme.of(context).color,
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, CityScreen.id),
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: IconTheme.of(context).color,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: FittedBox(
                  child: Row(
                    children: <Widget>[
                      Text(
                        weatherModel.main.temp == null
                            ? 'no current data!'
                            : '${weatherModel.main.temp} °',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        weatherModel.main.temp == null
                            ? 'no current data!'
                            : getWeatherIcon(weatherModel.weather[0].id),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    // height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      weatherModel.main.temp == null
                          ? 'no current data!'
                          : getMessage(weatherModel.main.temp) +
                              " in " +
                              weatherModel.name,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 70.0
                              : 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      weatherModel.main.temp == null
                          ? 'no current data!'
                          : "${weatherModel.weather[0].description} In ${weatherModel.name}!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
