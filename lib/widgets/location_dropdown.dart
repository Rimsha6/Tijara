import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  LatLng? selectedLocation;
  String selectedAddress = '';
  GoogleMapController? mapController;

  void _onMapTap(LatLng position) async {
    setState(() {
      selectedLocation = position;
    });

    /// Get address from lat/lng
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      setState(() {
        selectedAddress =
            "${place.name}, ${place.locality}, ${place.administrativeArea}";
      });
    }
  }

  void _confirmLocation() {
    if (selectedLocation != null) {
      Navigator.pop(context, {
        'lat': selectedLocation!.latitude,
        'lng': selectedLocation!.longitude,
        'address':
            selectedAddress.isNotEmpty ? selectedAddress : "Selected Location",
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please tap on the map to select a location.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Location"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: const CameraPosition(
              target: LatLng(33.6844, 73.0479), // Pakistan center
              zoom: 12,
            ),
            onTap: _onMapTap,
            markers: selectedLocation != null
                ? {
                    Marker(
                      markerId: const MarkerId('selected'),
                      position: selectedLocation!,
                    )
                  }
                : {},
          ),
          if (selectedAddress.isNotEmpty)
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    selectedAddress,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: _confirmLocation,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: const Text(
            "Confirm Location",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
