import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../core/consts/colors.dart';
import 'location_provider.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLocation());
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final selectedPosition = locationProvider.selectedPosition;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: green,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Select Location",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: selectedPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (controller) => mapController = controller,
                    initialCameraPosition: CameraPosition(
                      target: selectedPosition,
                      zoom: 15,
                    ),
                    onTap: locationProvider.selectNewPosition,
                    markers: {
                      Marker(
                        markerId: const MarkerId("selected-location"),
                        position: selectedPosition,
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Center(
                          child: Text(
                            locationProvider.pickupAddress.isNotEmpty
                                ? locationProvider.pickupAddress
                                : "Select Location from Map",
                            style: const TextStyle(
                              fontFamily: 'medium',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final pos = locationProvider.selectedPosition;
                    if (pos != null) {
                      Navigator.pop(context, {
                        "latitude": pos.latitude,
                        "longitude": pos.longitude,
                        "address": locationProvider.pickupAddress,
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Confirm Location",style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 12),
              ],
            ),
    );
  }
}
