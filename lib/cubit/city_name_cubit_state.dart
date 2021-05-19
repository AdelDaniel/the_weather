part of 'city_name_cubit.dart';

class CityNameCubitState extends Equatable {
  final String cityName;
  CityNameCubitState({
    @required this.cityName,
  });

  @override
  List<Object> get props => [this.cityName];
}
