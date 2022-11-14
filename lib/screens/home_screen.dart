import 'dart:async';
import 'dart:developer';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> completer = Completer();
  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(31.167674333756423, 31.798463277518753),
    zoom: 14.4746,
  );
  List<Marker> markers = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(31.167674333756423, 31.798463277518753),
      infoWindow: InfoWindow(title: 'Yahya Position'),
    ),
  ];
  LatLng latLng = const LatLng(31.167674333756423, 31.798463277518753);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        markers: Set<Marker>.of(markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (controller) {
          completer.complete(controller);
        },
        onCameraMove: (position) {
          latLng = position.target;
        },
        padding: const EdgeInsets.only(top: 100),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: toAddress,
      //   child: const Icon(Icons.location_searching_rounded),
      // ),
    );
  }

  void goTocurrentLocation() async {
    // final GoogleMapController controller = await completer.future;
    // LocationData currentLocation;
    // var location = Location();
    // LatLng currentLatLng = latLng;
    // try {
    //   currentLocation = await location.getLocation();
    //   currentLatLng =
    //       LatLng(currentLocation.latitude!, currentLocation.longitude!);
    // } catch (e) {
    //   // log(e.toString());
    // }
    // controller.animateCamera(CameraUpdate.newCameraPosition(
    //   CameraPosition(
    //     bearing: 0,
    //     target: currentLatLng,
    //     zoom: 17.0,
    //   ),
    // ));
  }

  toAddress() async {
    //   Coordinates coordinates = Coordinates(latLng.latitude, latLng.longitude);
    //   List<Placemark> placemarks =
    //       await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    //   var address =
    //       await Geocoder.local.findAddressesFromCoordinates(coordinates);
    //   var first = address.first;
    //   log(address.first.toString());
    //   log(placemarks[0].toString());
    //   showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return Container(
    //         height: 100,
    //         child:
    //             Text(first.featureName.toString() + first.addressLine.toString()),
    //         // child: Text(placemarks.toString()),
    //       );
    //     },
    //   );
  }
}
