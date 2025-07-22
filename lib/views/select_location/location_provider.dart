import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier {
  LatLng? _selectedPosition;
  String _pickupAddress = '';
  final String _googleApiKey = 'AIzaSyD6ir49NkvWqBwj-GJXoEoRAPoJgPaSHGE';

  LatLng? get selectedPosition => _selectedPosition;
  String get pickupAddress => _pickupAddress;

  /// This Function will Get user Current location >>>
  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }


    /// ask Google Map location permission >>>>>
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
      return;
    }

     /// This will assign location coordinates into _selectedPosition variable >>>
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    _selectedPosition = LatLng(position.latitude, position.longitude);
    await _fetchAddress(position.latitude, position.longitude);
    notifyListeners();
  }

  Future<void> selectNewPosition(LatLng newPosition) async {
    _selectedPosition = newPosition;
    await _fetchAddress(newPosition.latitude, newPosition.longitude);
    notifyListeners();
  }

  /// This API will convert selected location coordinates into formatted address form >>>>
  Future<void> _fetchAddress(double lat, double lng) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$_googleApiKey',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['results'].isNotEmpty) {
          final components = data['results'][0]['address_components'];

          String? area;
          String? city;
          String? state;

          for (var component in components) {
            final types = List<String>.from(component['types']);

            if (types.contains('sublocality') || types.contains('sublocality_level_1')) {
              area ??= component['long_name'];
            }
            if (types.contains('locality')) {
              city = component['long_name'];
            }
            if (types.contains('administrative_area_level_1')) {
              state = component['short_name']; // or 'long_name'
            }
          }

          if (area != null && city != null && state != null) {
            _pickupAddress = '$area, $city, $state';
          } else {
            _pickupAddress = data['results'][0]['formatted_address'];
          }
        } else {
          _pickupAddress = 'Address not found.';
        }
      } else {
        _pickupAddress = 'Failed to fetch address.';
      }
    } catch (e) {
      _pickupAddress = 'Error: $e';
    }
  }

}
