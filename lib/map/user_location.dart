import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserLocation extends StatefulWidget {
  const GetUserLocation({super.key});

  @override
  State<GetUserLocation> createState() => _GetUserLocationState();
}

class _GetUserLocationState extends State<GetUserLocation> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.751524063317138, 100.4927341283359),
    zoom: 14,
  );

  final List<Marker> _markers = const <Marker>[
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(13.751524063317138, 100.4927341283359),
      infoWindow: InfoWindow(title: "The title of the marker"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
