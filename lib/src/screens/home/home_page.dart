import 'dart:async';

import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  int _index = 0;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: CircleAvatar(child: Icon(Icons.menu,color: Colors.black
            ,),radius: 5,backgroundColor: Colors.white,),
        ),
      ),
      bottomNavigationBar: ClipRRect(clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
            currentIndex: _index,
              onTap: (index){
                setState(() {
                  _index = index;
                });
              },
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.grey,

              selectedIconTheme: IconThemeData(color: kPrimaryColor),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.car_rental),title: Text("Truck")),
                BottomNavigationBarItem(icon: Icon(Icons.car_rental),title: Text("Car")),
                BottomNavigationBarItem(icon: Icon(Icons.car_rental),title: Text("Keke")),
                BottomNavigationBarItem(icon: Icon(Icons.car_rental),title: Text("Okada")),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
          Positioned(
            top:100,left: 20,right: 20,
            child: Container(
              width: 500,
              padding: EdgeInsets.all(20),
              decoration: kContainerBorder(10.0).copyWith(boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 10,spreadRadius: 3,offset: Offset(0,5))]),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset("assets/icons/home_icon.png",height: 64,),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Santa Barbara",style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.start,),
                        Container(height: 1,color: Colors.grey.shade200,width: 280,margin: EdgeInsets.symmetric(vertical: 14),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Destination",style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey,),),
                            SizedBox(
                            width: 170,
                            ),
                            Icon(Icons.search_rounded,color: Colors.grey,)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
backgroundColor: Colors.white,

        child: Icon(Icons.my_location_rounded,color: Colors.black,),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
