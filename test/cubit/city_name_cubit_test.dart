import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather/cubit/city_name_cubit.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('test the cubit', () {
    CityNameCubit cityNameCubit;
    setUp(() {
      cityNameCubit = CityNameCubit();
    });

    tearDown(() {
      cityNameCubit.close();
    });

    test(
        'the inital state of the cityNameCubit is CityNameCubitState(cityName: " ")  ',
        () {
      expect(cityNameCubit.state, CityNameCubitState(cityName: " "));
    });

    blocTest<CityNameCubit, CityNameCubitState>(
      'test the onChange method',
      build: () => CityNameCubit(),
      act: (cityNameCubit) => cityNameCubit.onChanged("adel nabil daniel"),
      expect: () => [CityNameCubitState(cityName: "adel nabil daniel")],
    );
  });
}
