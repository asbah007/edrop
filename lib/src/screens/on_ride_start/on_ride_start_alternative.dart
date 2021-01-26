import 'dart:async';
import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/trip_summary/trip_summary_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class OnRideStartAlter extends StatefulWidget {
  @override
  _OnRideStartAlterState createState() => _OnRideStartAlterState();
}

class _OnRideStartAlterState extends State<OnRideStartAlter>
    with SingleTickerProviderStateMixin {
  Completer<GoogleMapController> _controller = Completer();
  int _index = 0;
  double _width = 147;

  _launchURL() async {
    const url = 'tel:+1 111 010 009';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  PolylinePoints polylinePoints = PolylinePoints();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.3697536, -122.1097334),
    zoom: 14.2746,
  );

  LatLng pinPosition = LatLng(37.3797536, -122.1017334);
  LatLng pinPosition2 = LatLng(37.3597536, -122.1097334);

  List<BitmapDescriptor> pinLocationIcon = [];
  Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  void setCustomMapPin(List<String> type) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBGOjv52IeGuG5y8WOHV4UbFkB6PIFBTtM",
        PointLatLng(pinPosition.latitude, pinPosition.longitude),
        PointLatLng(pinPosition2.latitude, pinPosition2.longitude));
    type.forEach((element) {
      BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
              'assets/icons/$element.png')
          .then((value) => pinLocationIcon.add(value));
    });
    Future.delayed(Duration(seconds: 1), () {
      _markers.addAll([
        Marker(
            markerId: MarkerId("zczsc"),
            anchor: Offset(0.5, 0.5),
            position: pinPosition,
            rotation: 185,
            infoWindow:
                InfoWindow(title: "ETA 3 minutes", anchor: Offset(0.5, 1)),
            icon: pinLocationIcon[1]),
        Marker(
            markerId: MarkerId("czcasv"),
            position: pinPosition2,
            anchor: Offset(0.5, 0.5),
            icon: pinLocationIcon[0]),
      ]);

      _polyline.add(Polyline(
        polylineId: PolylineId("_lastMapPosition"),
        visible: true,
        width: 5,
        endCap: Cap.roundCap,
        geodesic: true,
        startCap: Cap.buttCap,
        jointType: JointType.round,
        points:
            result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
        color: Color(0xff7A3EFB),
      ));
      setState(() {});
    });
  }

  bool showPicker = false;
  bool _pickupBoxOpen = false;
  AnimationController _controoller;

  @override
  void initState() {
    setCustomMapPin(["ellipse1", "vehicle1"]);
    _controoller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            radius: 5,
            backgroundColor: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              child: Text(
                "SOS",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.red),
              ),
              radius: 20,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.to(TripSummary(), transition: Transition.fade);
        },
        child: Container(
          height: 210,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: kContainerBorder(12.0).copyWith(boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.grey,
                blurRadius: 15,
                spreadRadius: 0.6)
          ]),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                height: 56,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                    color: Colors.black),
                child: Text(
                  "Trip id : 1826844",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                leading: Container(
                    child: Image.asset(
                      "assets/images/person.png",
                    ),
                    decoration: kContainerBorder(10.0)),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "John Doe",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "Cancel",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.red),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: kPrimaryColor,
                          size: 15,
                        ),
                        Icon(
                          Icons.star_border_purple500_outlined,
                          color: kPrimaryColor,
                          size: 15,
                        ),
                      ],
                    ),
                    Text(
                      "Volswagan polo gt\nABC-123DE",
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                isThreeLine: true,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        height: 50,
                        child: Text("Instructions",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.black)),
                        onPressed: () {},
                        color: kSecondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FlatButton(
                        height: 50,
                        child: Text("Call",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white)),
                        onPressed: () {
                          _launchURL();
                        },
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        polylines: _polyline,
        markers: _markers,
        initialCameraPosition: _kGooglePlex,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
