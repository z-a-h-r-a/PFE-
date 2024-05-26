import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:todo/view/side_menu.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
// initial geoposition
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746, // for zoom
  );
// another geoposition
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 45, 107, 1.0),
        title: const Text(
          '𝐋𝐨𝐜𝐚𝐭𝐢𝐨𝐧 ',
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const Drawer(
          // backgroundColor: const Color.fromARGB(0, 25, 62, 100),
          child: SideMenu()),
      //call GoogleMap() for rendering Google Maap Screen
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex, // initially point Google Plex
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // this foating button is to change camera position to another location
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('𝐓𝐨 𝐭𝐡𝐞 𝐅𝐚𝐫𝐦!'), 
        icon: const Icon(Icons.home_repair_service_rounded),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
