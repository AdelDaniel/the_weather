import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'city_name_cubit_state.dart';

class CityNameCubit extends Cubit<CityNameCubitState> {
  // the parameter of the Super is an object of
  //cityNameCubitState( the initial value of city name)
  CityNameCubit() : super(CityNameCubitState(cityName: " "));

  void onChanged(String value) {
    emit(CityNameCubitState(cityName: value));
  }
}
