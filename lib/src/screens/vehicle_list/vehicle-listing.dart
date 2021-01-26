import 'dart:async';
import 'dart:math';

import 'package:aion/src/components/vehicle_listing_card.dart';
import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/custom_icon.dart';
import 'package:aion/src/config/custom_icon.dart';
import 'package:aion/src/config/custom_icon.dart';
import 'package:aion/src/config/custom_icon.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/driver_assigning_screen/driver_assign.dart';
import 'package:aion/src/screens/on_ride_start/on_ride_start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum RidingCharacter { myself, person2, person3, person4 }

class VehicleListing extends StatefulWidget {
  @override
  _VehicleListingState createState() => _VehicleListingState();
}

class _VehicleListingState extends State<VehicleListing>
    with SingleTickerProviderStateMixin {
  Completer<GoogleMapController> _controller = Completer();
  int _index = 0;

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

  void _onTap() {
    _pickupBoxOpen ? _pickupBoxOpen = false : _pickupBoxOpen = true;
    setState(() {});
  }

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
            icon: pinLocationIcon[1]),
        Marker(
            markerId: MarkerId("czcasv"),
            position: pinPosition2,
            anchor: Offset(0.5, 0.5),
            rotation: 50,
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

  @override
  void initState() {
    setCustomMapPin(["ellipse1", "ellipse2"]);

    super.initState();
  }

  RidingCharacter _selectedRider = RidingCharacter.myself;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _pickupBoxOpen
          ? Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: _pickupBoxOpen ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                // The green box must be a child of the AnimatedOpacity widget.
                child: Container(
                  decoration: kContainerBorder(12.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                            color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pickup Point",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      builder: (builder) {
                                        return StatefulBuilder(
                                          builder: (_, setState) => Container(
                                            height: 440.0,
                                            color: Color(0xFF737373),
                                            child: new Container(
                                                decoration: new BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: new BorderRadius
                                                            .only(
                                                        topLeft: const Radius
                                                            .circular(10.0),
                                                        topRight: const Radius
                                                            .circular(10.0))),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              10),
                                                        ),
                                                        color: Colors.black,
                                                      ),
                                                      height: 50,
                                                      width: double.infinity,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Spacer(
                                                            flex: 3,
                                                          ),
                                                          Text(
                                                            "Choose who's riding",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline5
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          Spacer(
                                                            flex: 2,
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            icon: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          RadioListTile<
                                                              RidingCharacter>(
                                                            value:
                                                                RidingCharacter
                                                                    .myself,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            0),
                                                            groupValue:
                                                                _selectedRider,
                                                            activeColor:
                                                                kPrimaryColor,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _selectedRider =
                                                                    value;
                                                              });
                                                            },
                                                            title: Row(
                                                              children: [
                                                                Icon(
                                                                  HomeIcons
                                                                      .frame_7,
                                                                  color: _selectedRider ==
                                                                          RidingCharacter
                                                                              .myself
                                                                      ? kPrimaryColor
                                                                      : null,
                                                                ),
                                                                SizedBox(
                                                                  width: 12,
                                                                ),
                                                                Text(
                                                                  "My Self",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline6
                                                                      .copyWith(
                                                                        color: _selectedRider ==
                                                                                RidingCharacter.myself
                                                                            ? kPrimaryColor
                                                                            : Colors.black,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          RadioListTile(
                                                            value:
                                                                RidingCharacter
                                                                    .person3,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            0),
                                                            groupValue:
                                                                _selectedRider,
                                                            activeColor:
                                                                kPrimaryColor,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _selectedRider =
                                                                    value;
                                                              });
                                                            },
                                                            title: Row(
                                                              children: [
                                                                Icon(
                                                                  HomeIcons
                                                                      .frame_7,
                                                                ),
                                                                SizedBox(
                                                                  width: 12,
                                                                ),
                                                                Text(
                                                                  "Paddy O'Furniture",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline6
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          RadioListTile(
                                                            value:
                                                                RidingCharacter
                                                                    .person4,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            0),
                                                            groupValue:
                                                                _selectedRider,
                                                            activeColor:
                                                                kPrimaryColor,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _selectedRider =
                                                                    value;
                                                              });
                                                            },
                                                            title: Row(
                                                              children: [
                                                                Icon(HomeIcons
                                                                    .frame_7),
                                                                SizedBox(
                                                                  width: 12,
                                                                ),
                                                                Text(
                                                                  "Olive Yew",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline6
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          RadioListTile(
                                                            value:
                                                                RidingCharacter
                                                                    .person2,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            0),
                                                            groupValue:
                                                                _selectedRider,
                                                            activeColor:
                                                                kPrimaryColor,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _selectedRider =
                                                                    value;
                                                              });
                                                            },
                                                            title: Row(
                                                              children: [
                                                                Icon(
                                                                  HomeIcons
                                                                      .frame_7,
                                                                ),
                                                                SizedBox(
                                                                  width: 12,
                                                                ),
                                                                Text(
                                                                  "Allie Grater",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline6
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        16,
                                                                    horizontal:
                                                                        10),
                                                            child: FlatButton(
                                                              height: 50,
                                                              minWidth: double
                                                                  .infinity,
                                                              child: Text(
                                                                  "Add from Contact",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline6
                                                                      .copyWith(
                                                                          color:
                                                                              kPrimaryColor)),
                                                              onPressed: () {},
                                                              color: Color(
                                                                  0xffF5F5F5),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: FlatButton(
                                                              height: 50,
                                                              minWidth: double
                                                                  .infinity,
                                                              child: Text(
                                                                  "Confirm",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline6
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.white)),
                                                              onPressed: () {
                                                                Get.to(
                                                                    DriverAssign());
                                                              },
                                                              color:
                                                                  kPrimaryColor,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  height: 32,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: kContainerBorder(8.0)
                                      .copyWith(color: Color(0xFF4B4B4B)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        HomeIcons.frame_7,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Myself",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
                        title: Text(
                            "Santa Barabara International school, Santa Barbara"),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 8, right: 8),
                        child: FlatButton(
                          height: 50,
                          minWidth: double.infinity,
                          child: Text("Confirm",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white)),
                          onPressed: () {
                            Get.to(DriverAssign(),
                                transition: Transition.downToUp);
                          },
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Container(
              height: 200,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (_, index) => VehicleListingCard(
                  onTap: () {
                    _onTap();
                  },
                ),
              )),
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
