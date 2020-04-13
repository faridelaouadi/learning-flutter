import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Location({this.longitude, this.latitude});

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
