import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app/utils/shared/app_snackbar.dart';

class LocationHelper {
  Future<Position?> getCurrentLocation(BuildContext context) async {
    final GeolocatorPlatform geoLocatorPlatform = GeolocatorPlatform.instance;

    LocationPermission permission;

    permission = await geoLocatorPlatform.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await geoLocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously
        snackBar(context, message: 'Location permissions are denied');
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await geoLocatorPlatform.requestPermission();
      // ignore: use_build_context_synchronously
      snackBar(context,
          message: 'Location permissions are denied, allow from settings');
      return null;
    }
    Position location = await geoLocatorPlatform.getCurrentPosition(
       );
    debugPrint(
        'longitude: ${location.longitude}, Latitude: ${location.latitude}');
    return location;
  }
}
