import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late GoogleMapController _mapController;
  final LatLng _initialPosition = LatLng(-6.20015, 39.21739);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 14,
          ),
          onMapCreated: (controller) {
            _mapController = controller;
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,

          markers: {
            const Marker(
              markerId: MarkerId(''),
              position: LatLng(-6.20015, 39.21739),
            ),
          },
        ),
      ),
    );
  }
}
