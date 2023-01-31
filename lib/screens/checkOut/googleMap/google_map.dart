// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/checkOut/addDeliveryAddress/addDeliverAdd.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';
import '../../../providers/check_out_provider.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<CustomGoogleMaps> {
  GoogleMapController? controller;
  final Location _location = Location();
  void _onMapCreated(GoogleMapController value) {
    controller = value;
    _location.onLocationChanged.listen((event) {
      controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(event.latitude!, event.longitude!),
            zoom: 15,
          ),
        ),
      );
    });
  }

  LatLng _initialCameraPosition = LatLng(20.5937, 78.9629);
  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          ' Google Map',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialCameraPosition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              mapToolbarEnabled: true,
              myLocationEnabled: true,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  right: 60,
                  left: 10,
                  bottom: 40,
                  top: 40,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    await _location.getLocation().then(
                      (value) {
                        setState(
                          () {
                            checkOutProvider.setLocation = value;
                          },
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddDeliveryAddress(),
                          ),
                        );
                      },
                    );
                  },
                  color: primaryColor,
                  shape: const StadiumBorder(),
                  child: const Text('Set Location'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//AIzaSyCjnjQ5e-Aqhw-pFYRLLccIwigMFcD60iw
