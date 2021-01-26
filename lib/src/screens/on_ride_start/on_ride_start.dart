import 'dart:async';

import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/trip_summary/trip_summary_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum Page { screenDashboard, screenProfile, screenSearch }

extension on Page {
  String get route => describeEnum(this);
}

Completer<GoogleMapController> _controller = Completer();
int _index = 0;

final CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

class MainBodyApp extends HookWidget {
  final Map<Page, Widget> _fragments = {
    Page.screenDashboard: DashboardPage(),
    Page.screenProfile: UserProfilePage(),
    Page.screenSearch: SearchPage(),
  };

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalObjectKey<NavigatorState>(context);

    return WillPopScope(
      onWillPop: () async {
        if (navigatorKey.currentState.canPop()) {
          navigatorKey.currentState.pop();
          return false;
        }

        return true;
      },
      child: Scaffold(
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
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                liteModeEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  // _controller.complete(controller);
                },
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  height: 250,
                  width: 200,
                  child: Navigator(
                    key: navigatorKey,
                    initialRoute: Page.screenDashboard.route,
                    onGenerateRoute: (settings) {
                      final pageName = settings.name;

                      final page = _fragments.keys.firstWhere(
                          (element) => describeEnum(element) == pageName);

                      return MaterialPageRoute(
                          settings: settings,
                          builder: (context) => _fragments[page]);
                    },
                  ),
                ),
              ),
              // Positioned(
              //   bottom: 10,
              //   left: 5,
              //   right: 5,
              //   child: Container(
              //     height: 50.0,
              //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //     color: Colors.indigo[400],
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: <Widget>[
              //         RaisedButton(
              //           onPressed: () => navigatorKey.currentState
              //               .pushNamedAndRemoveUntil(
              //                   Page.screenDashboard.route, (route) => false),
              //           child: Text('Dashboard'),
              //         ),
              //         RaisedButton(
              //           onPressed: () => navigatorKey.currentState
              //               .pushNamedAndRemoveUntil(
              //                   Page.screenProfile.route, (route) => false),
              //           child: Text('Profile'),
              //         ),
              //         RaisedButton(
              //           onPressed: () => navigatorKey.currentState
              //               .pushNamedAndRemoveUntil(
              //                   Page.screenSearch.route, (route) => false),
              //           child: Text('Search'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(' screenProfile ...'),
        ),
      ],
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(TripSummary(), transition: Transition.fade);
          },
          child: Container(
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
                  title: Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.headline5,
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
                          onPressed: () {},
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
      ],
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(' screenSearch ...'),
    );
  }
}
