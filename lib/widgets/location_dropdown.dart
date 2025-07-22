import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  LatLng? selectedLocation;
  String selectedAddress = '';
  GoogleMapController? mapController;
  CameraPosition? initialCameraPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location services are disabled.")),
      );
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location permission denied permanently.")),
      );
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission denied.")),
        );
        return;
      }
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition();
    LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      initialCameraPosition = CameraPosition(target: currentLatLng, zoom: 14);
    });
  }

  void _onMapTap(LatLng position) async {
    setState(() {
      selectedLocation = position;
      selectedAddress = "Getting address...";
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        testReverseGeocoding();
        Placemark place = placemarks.first;
        setState(() {
          selectedAddress =
          "${place.name}, ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        });
      } else {
        setState(() {
          selectedAddress = "Address not found.";
        });
      }
    } catch (e) {
      print("Reverse geocoding error: $e");
      setState(() {
        selectedAddress = "Address fetch failed.";
      });
    }
  }
  void testReverseGeocoding() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(33.6844, 73.0479);
      print("???????????????????$placemarks");
    } catch (e) {
      print('Error: $e');
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
      body: initialCameraPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: initialCameraPosition!,
            onTap: _onMapTap,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
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
