import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather/cubit/city_name_cubit.dart';

class CubitTestScreen extends StatelessWidget {
  static const String id = "CubitTestScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CityNameCubit>(
      create: (context) => CityNameCubit(),
      child: Scaffold(
        body: TheContent(),
      ),
    );
  }
}

class TheContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                // errorText: snapshot.error,
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Enter the City Name',
                icon: Icon(Icons.location_city, size: 30.0),
              ),
              onChanged: BlocProvider.of<CityNameCubit>(context).onChanged,
            )),
        BlocBuilder<CityNameCubit, CityNameCubitState>(
          builder: (context, state) {
            return Text(state.cityName);
          },
        ),
      ],
    );
  }
}
