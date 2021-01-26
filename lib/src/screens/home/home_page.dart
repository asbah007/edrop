import 'dart:async';
import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/custom_icon.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/dash_board_screens/screens/about_screen.dart';
import 'package:aion/src/screens/dash_board_screens/screens/help_screen.dart';
import 'package:aion/src/screens/dash_board_screens/screens/notification_screen.dart';
import 'package:aion/src/screens/dash_board_screens/screens/profile_screen.dart';
import 'package:aion/src/screens/dash_board_screens/screens/settings_screens.dart';
import 'package:aion/src/screens/dash_board_screens/screens/trip_history_screen.dart';
import 'package:aion/src/screens/expanded_search/search_expand.dart';
import 'package:aion/utils/packages/Rating_bar.dart';
import 'package:aion/utils/packages/fade_text.dart';
import 'package:aion/utils/packages/vertical-stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = Get.arguments ?? false;
  Completer<GoogleMapController> _controller = Completer();
  int _index = 0;
  static final LatLng center = const LatLng(-33.86711, 151.1947171);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.3857536, -122.1017334),
    zoom: 14.2746,
  );

  LatLng pinPosition = LatLng(37.3797536, -122.1017334);

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};

  void setCustomMapPin(String type) async {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'assets/icons/$type.png')
        .then((value) => pinLocationIcon = value);
    Future.delayed(Duration(seconds: 1), () {
      _markers.addAll([
        Marker(
            markerId: MarkerId("zczsc"),
            position: pinPosition,
            icon: pinLocationIcon),
        Marker(
            markerId: MarkerId("czcasv"),
            position: LatLng(37.3897536, -122.1047334),
            rotation: 50,
            icon: pinLocationIcon),
        Marker(
            markerId: MarkerId("dadvsv"),
            position: LatLng(37.3857536, -122.1017334),
            rotation: 100,
            icon: pinLocationIcon),
        Marker(
            markerId: MarkerId("‘<MARKER_ID>’"),
            position: LatLng(37.3757536, -122.1085334),
            rotation: 160,
            icon: pinLocationIcon),
      ]);
      setState(() {});
    });
  }

  var rating = 0.0;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.3857536, -122.1017334),
      tilt: 59.440717697143555,
      zoom: 14.2746);

  @override
  void initState() {
    setCustomMapPin("vehicle0");
    data
        ? Future.delayed(
            Duration(seconds: 1),
            () => Get.dialog(
                StatefulBuilder(
                  builder: (context, setState) => Center(
                    child: VerticalStackDialog(
                      padding: EdgeInsets.all(10),
                      showCloseIcon: false,
                      isDense: false,
                      keyboardAware: true,
                      btnCancel: FlatButton(
                        height: 50,
                        minWidth: double.infinity,
                        child: Text("Submit",
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
                      body: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "How was your trip with",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              "John Doe",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SmoothStarRating(
                                allowHalfRating: true,
                                halfFilledIconData: Icons.star_half_rounded,
                                rating: rating,
                                onRatingChanged: (v) {
                                  setState(() {
                                    rating = v;
                                  });
                                },
                                starCount: 5,
                                // rating: rating,
                                size: 57.0,
                                defaultIconData: Icons.star_border_rounded,
                                filledIconData: Icons.star_rounded,
                                color: kPrimaryColor,
                                borderColor: kPrimaryColor,
                                spacing: 0.0),
                            SizedBox(
                              height: 24,
                            ),
                            Wrap(
                              spacing: 5,
                              children: [
                                Chip(
                                  label: Text("Lorem epsum"),
                                ),
                                Chip(
                                  label: Text("Lorem"),
                                ),
                                Chip(
                                  label: Text("lasum"),
                                ),
                                Chip(
                                  label: Text("effazo"),
                                ),
                                Chip(
                                  label: Text("escusto epsum"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      header: CircleAvatar(
                        maxRadius: 49,
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                    ),
                  ),
                ),
                useSafeArea: true,
                name: "cdbjn"))
        : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Builder(
            builder: (BuildContext context) {
              return CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(
                    HomeIcons.banner,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(31),
                ),
                color: Color(0xff2f3133),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 80,
                    color: Colors.grey,
                  ),
                  Text(
                    "Allie Grater",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Text("+234 703622964",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center)
                ],
              ),
            ),
            Expanded(
              child: Container(
                  color: Color(0xff2f3133),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(31),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(NotificationScreen());
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 60),
                          title: Text(
                            "Notification",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          leading: Icon(
                            Icons.add_alert,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(ProfileScreen());
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 60),
                          title: Text(
                            "Edit Profile",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          leading: Icon(
                            Icons.person_rounded,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(SettingsPage());
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 60),
                          title: Text(
                            "Settings",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          leading: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(TripHistory());
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 60),
                          title: Text(
                            "Trip History",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          leading: Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(AboutPage());
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 60),
                          title: Text(
                            "About",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          leading: Icon(
                            Icons.people_alt_rounded,
                            color: Colors.black,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(HelpPage());
                          },
                          contentPadding: EdgeInsets.symmetric(horizontal: 60),
                          title: Text(
                            "Help",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          leading: Icon(
                            Icons.help,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text("V0.0.1",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey)),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _markers.clear();
              setCustomMapPin("vehicle$index");
              print(index);
              _index = index;
            });
          },
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color: kPrimaryColor),
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    HomeIcons.frame_4,
                    size: 18,
                  ),
                ),
                title: Text("Truck")),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Icon(
                    HomeIcons.frame_2,
                    size: 18,
                  ),
                ),
                title: Text("Car")),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    HomeIcons.frame_3,
                    size: 18,
                  ),
                ),
                title: Text("Keke")),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    HomeIcons.frame_1,
                    size: 18,
                  ),
                ),
                title: Text("Okada")),
          ],
        ),
      ),
      body: Stack(children: [
        GoogleMap(
          markers: _markers,
          mapType: MapType.normal,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Get.to(SearchScreen());
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: kContainerBorder(10.0).copyWith(boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5))
              ]),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/icons/home_icon.png",
                    height: 64,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Text("Santa Barbara",
                              style: Theme.of(context).textTheme.subtitle1),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade200,
                          margin: EdgeInsets.symmetric(vertical: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FadeAnimatedTextKit(
                              text: [
                                "Enter your destination!",
                                "Los Angeles!!",
                                "Arizona!!!"
                              ],
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                              textAlign: TextAlign.start,
                              totalRepeatCount: 10,
                            ),
                            Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
        backgroundColor: Colors.white,
        child: Icon(
          HomeIcons.frame_6,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
