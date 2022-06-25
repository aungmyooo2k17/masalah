import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_availability/google_api_availability.dart';

class CurrentLatLng {
  final double lat;
  final double lng;
  CurrentLatLng(this.lat, this.lng);
}

abstract class LocationService {
  Future<CurrentLatLng?> getCurrentLocation();
}

class LocationServiceImpl implements LocationService {
  @override
  Future<CurrentLatLng?> getCurrentLocation() async {
   
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        Position currentLocation = await isGoogleServiceAvailable()
            ? await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.medium)
            : await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.medium,
                forceAndroidLocationManager: true);
        print('currentLocation : $currentLocation');
        return CurrentLatLng(
            16.7750381972987, 96.1552488395536);
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
      
    }
    return null;
  }

  Future<bool> isGoogleServiceAvailable() async {
    GooglePlayServicesAvailability availability = await GoogleApiAvailability
        .instance
        .checkGooglePlayServicesAvailability();
    if (availability == GooglePlayServicesAvailability.serviceDisabled ||
        availability == GooglePlayServicesAvailability.serviceInvalid ||
        availability == GooglePlayServicesAvailability.serviceMissing) {
      return false;
    }
    return true;
  }
}
