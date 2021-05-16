import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../model/location_model.dart';

class GeoLocatorService {
  static const String latitude = "latitude";
  static const String longitude = "longitude";
  Position _position;

  Future<LocationModel> getLatLog() async {
    switch (await _checkPermission()) {
      case LocationPermission.deniedForever:
        {
          throw "the Loction Is Denied For Ever!";
        }
        break;
      case LocationPermission.denied:
        {
          await _requestPermission();
          return await getLatLog();
        }
        break;
      default:
        // LocationPermission.whileInUse or LocationPermission.always
        {
          print('get position!');
          _position = await _currentPosition();
          return LocationModel(
              latitude: _position.latitude, longitude: _position.longitude);
        }
        break;
    }
  }

  /// before using the [_lastPostion] or [_currentPosition]
  /// make Sure to checkPermission
  Future<Position> _lastPosition() async {
    return await Geolocator.getLastKnownPosition();
  }

  Future<Position> _currentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<LocationPermission> _checkPermission() async {
    return await Geolocator.checkPermission();
  }

  Future<LocationPermission> _requestPermission() async {
    return await Geolocator.requestPermission();
  }

  StreamSubscription<Position> _positionStreamSubscription;
  bool _isListening() => !(_positionStreamSubscription == null ||
      _positionStreamSubscription.isPaused);

  void _toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = Geolocator.getPositionStream();
      _positionStreamSubscription = positionStream.handleError((error) {
        _positionStreamSubscription?.cancel();
        _positionStreamSubscription = null;
      }).listen((position) => position.toString());
      _positionStreamSubscription?.pause();
    }

    if (_positionStreamSubscription == null) {
      return;
    }
    if (_positionStreamSubscription.isPaused) {
      _positionStreamSubscription.resume();
    } else {
      _positionStreamSubscription.pause();
    }
  }

  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }
  }
}
