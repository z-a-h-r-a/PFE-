// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:todo/view/side_menu.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Location location = Location();
  Set<Marker> markers = {};

//markers to the map
  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _getUserLocation();
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(37.7749, -122.4194),
        infoWindow: InfoWindow(title: 'San Francisco'),
      ));
    });
  }

  Future<void> _getUserLocation() async {
    final userLocation = await location.getLocation();
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('userLocation'),
        position: LatLng(userLocation.latitude!, userLocation.longitude!),
        infoWindow: InfoWindow(title: 'Your Location'),
      ));
    });
  }

  Set<Polyline> polylines = {
    Polyline(
      polylineId: PolylineId('route1'),
      points: [
        LatLng(37.7749, -122.4194),
        LatLng(37.8051, -122.4300),
        LatLng(37.8070, -122.4093),
      ],
      color: Colors.blue,
      width: 4,
    ),
  };

  Set<Polygon> polygons = {
    Polygon(
      polygonId: PolygonId('area1'),
      points: [
        LatLng(37.7749, -122.4194),
        LatLng(37.8051, -122.4300),
        LatLng(37.8070, -122.4093),
      ],
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: Colors.green,
      strokeWidth: 2,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Maps in Flutter')),
      drawer: const Drawer(
          // backgroundColor: const Color.fromARGB(0, 25, 62, 100),
          child: SideMenu()),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // San Francisco coordinates
          zoom: 12,
        ),
        markers: markers,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
      ),
    );
  }
}
