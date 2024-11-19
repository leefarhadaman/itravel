// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController _mapController;
//   Set<Marker> _markers = Set<Marker>();
//   LatLng _initialPosition = LatLng(37.7749, -122.4194); // Default to San Francisco
//
//   // Get user's current location
//   Future<void> _getUserLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _initialPosition = LatLng(position.latitude, position.longitude);
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getUserLocation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Travel Map')),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: _initialPosition,
//           zoom: 12,
//         ),
//         markers: _markers,
//         onMapCreated: (controller) {
//           _mapController = controller;
//         },
//       ),
//     );
//   }
// }
