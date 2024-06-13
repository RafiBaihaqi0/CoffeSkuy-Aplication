import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Use 'latlong' package for LatLng

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  MapScreen({required this.latitude, required this.longitude});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  LatLng _currentCenter = LatLng(0, 0);
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _currentCenter = LatLng(widget.latitude, widget.longitude);
    _markers = [
      Marker(
        width: 80.0,
        height: 80.0,
        point: _currentCenter,
        child: const Icon(
          Icons.location_on,
          color: Colors.red,
          size: 40.0,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _currentCenter,
          initialZoom: 17,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app', // Replace with your app's package name
          ),
          MarkerLayer(
            markers: _markers,
          ),
        ],
      ),
    );
  }
}
