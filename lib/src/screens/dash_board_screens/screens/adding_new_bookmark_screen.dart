import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/dash_board_screens/screens/add_google_point.dart';
import 'package:aion/src/screens/home/home_page.dart';
import 'package:aion/src/screens/vehicle_list/vehicle-listing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBookMark extends StatefulWidget {
  @override
  _AddBookMarkState createState() => _AddBookMarkState();
}

class _AddBookMarkState extends State<AddBookMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            decoration: kContainerBorder(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  child: CircleAvatar(
                    backgroundColor: kLightGrey,
                    radius: 8,
                  ),
                  backgroundColor: kPrimaryColor,
                  radius: 10,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    height: 48,
                    decoration: kContainerBorder(10.0).copyWith(
                      color: Color(0xffF7F7F7),
                    ),
                    child: TextField(
                      decoration: kTextFieldDecor(title: "  Add Location"),
                    ),
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(80),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 7, top: 25),
        children: [
          ListTile(
            leading: Container(
              child: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              padding: EdgeInsets.all(10),
              decoration: kContainerBorder(10.0),
            ),
            title: Text("Home"),
            subtitle: Text("3139 Jadewood farms"),
          ),
          ListTile(
            leading: Container(
              child: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              padding: EdgeInsets.all(10),
              decoration: kContainerBorder(10.0),
            ),
            title: Text("Collage"),
            subtitle: Text("3288 Foresston Road"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FlatButton(
              onPressed: () {
                Get.to(AddBookMarkOnMap());
              },
              color: Colors.white,
              height: 53,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.my_location_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Set Location on Map",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 4,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
