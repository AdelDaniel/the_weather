import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'city_name_cubit_state.dart';

class CityNameCubitCubit extends Cubit<CityNameCubitState> {
  // the parameter of the Super is an object of
  //cityNameCubitState( the initial value of city name)
  CityNameCubitCubit() : super(CityNameCubitState(cityName: ""));

  void onChanged() {}
}
