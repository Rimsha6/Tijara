import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  LatLng? _pickedLatLng;
  String? _pickedAddress;

  late GoogleMapController _mapController;

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _pickedAddress =
          "${place.street}, ${place.subLocality}, ${place.locality}";
        });
      }
    } catch (e) {
      print('Error in reverse geocoding: $e');
    }
  }

  void _onTap(LatLng position) {
    setState(() {
      _pickedLatLng = position;
    });
    _getAddressFromLatLng(position);
  }

  Future<Position> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick Location")),
      body: FutureBuilder<Position>(
        future: _getUserLocation(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final userPosition =
          LatLng(snapshot.data!.latitude, snapshot.data!.longitude);

          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition:
                CameraPosition(target: userPosition, zoom: 14),
                onTap: _onTap,
                markers: _pickedLatLng != null
                    ? {
                  Marker(
                    markerId: const MarkerId("picked"),
                    position: _pickedLatLng!,
                  )
                }
                    : {},
                onMapCreated: (controller) => _mapController = controller,
              ),
              if (_pickedAddress != null)
                Positioned(
                  bottom: 100,
                  left: 10,
                  right: 10,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        _pickedAddress!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              if (_pickedLatLng != null && _pickedAddress != null)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'address': _pickedAddress,
                        'lat': _pickedLatLng!.latitude,
                        'lng': _pickedLatLng!.longitude,
                      });
                    },
                    child: const Text("Confirm Location"),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
