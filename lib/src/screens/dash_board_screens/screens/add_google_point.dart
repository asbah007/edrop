import 'dart:async';

import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddBookMarkOnMap extends StatefulWidget {
  @override
  _AddBookMarkOnMapState createState() => _AddBookMarkOnMapState();
}

class _AddBookMarkOnMapState extends State<AddBookMarkOnMap> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng pinPosition = LatLng(37.3797536, -122.1017334);
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.3797536, -122.1017334),
    zoom: 14.4746,
  );
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/icons/pin_icon.png');
  }

  @override
  void initState() {
    setCustomMapPin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 140,
        margin: EdgeInsets.all(20),
        decoration: kContainerBorder(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Container(
                child: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(10),
                decoration: kContainerBorder(10.0).copyWith(
                  color: Color(0xFFE7E7E7),
                ),
              ),
              title: Text("Santa Barabara International school, Santa Barbara"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: FlatButton(
                height: 50,
                minWidth: double.infinity,
                child: Text("Confirm",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white)),
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0))),
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  color: Colors.black,
                                ),
                                height: 50,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "Save Location",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 48,
                                margin: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 16),
                                decoration: kContainerBorder(10.0).copyWith(
                                  color: Color(0xffF7F7F7),
                                ),
                                child: TextField(
                                  // autofocus: true,
                                  decoration: kTextFieldDecor(
                                      title: "  Enter title here"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16),
                                child: FlatButton(
                                  height: 50,
                                  minWidth: double.infinity,
                                  child: Text("Save",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.white)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  color: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ));
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            trafficEnabled: false,
            indoorViewEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 250,
            left: 90,
            right: 90,
            child: Image.asset(
              "assets/icons/pin_icon.png",
              alignment: Alignment.center,
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
