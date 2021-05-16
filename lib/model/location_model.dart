class LocationModel {
  double _latitude;
  double _longitude;

  LocationModel({
    double latitude,
    double longitude,
  })  : _latitude = latitude,
        _longitude = longitude;

  double get latitude => _latitude;
  double get longitude => _longitude;
}
