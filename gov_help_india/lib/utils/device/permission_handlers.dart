import 'package:geolocator/geolocator.dart';

class TPermissionHandlers {
  static Future<Position?> locationPermission() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    print("$locationPermission ---------------------------------------------------------------------");

    if(locationPermission == LocationPermission.denied){
      print("$locationPermission --------------------------------------------------------------------- if");

      locationPermission = await Geolocator.requestPermission();
      print("$locationPermission --------------------------------------------------------------------- if");

      if(locationPermission == LocationPermission.denied){
        return Future.error("Denied");
      }
    }

    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Denied");
    }

    return Geolocator.getCurrentPosition();
  }
}
