import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/dash_board_screens/screens/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'adding_new_bookmark_screen.dart';

class TripHistory extends StatefulWidget {
  @override
  _TripHistoryState createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Trip History",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.only(bottom: 30),
        children: [
          GestureDetector(
            onTap: () {
              Get.to(TripDetails());
            },
            child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: Offset(-1, 10),
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 38,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trip id : 1826844",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "9.30 am",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
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
                          Divider(),
                          Text(
                            "Trip",
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    letterSpacing: 0.5),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: VerticalDivider(
                                          color: kLightGrey,
                                          thickness: 5,
                                          width: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: kLightGrey,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: VerticalDivider(
                                          color: kLightGrey,
                                          thickness: 5,
                                          width: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: kPrimaryColor,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: kLightGrey,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          color: kLightGrey,
                                          thickness: 5,
                                          width: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: kPrimaryColor,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: kLightGrey,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Santa Barbara",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text("Gotham City",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text("Los Angeles International Airport",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: kLightGrey,
                                    ),
                                    Text("Add Rating")
                                  ],
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                ),
                                Text(
                                  "\$ 254.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Divider(
                  thickness: 1,
                  indent: 14,
                  endIndent: 14,
                ),
                Chip(
                  label: Text(
                    "Yesterday",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.only(bottom: 2, right: 20, left: 20),
                  backgroundColor: Colors.transparent,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.black12)),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(TripDetails());
            },
            child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: Offset(-1, 10),
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 38,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trip id : 1826844",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "9.30 am",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            leading: Container(
                                child: Image.asset(
                                  "assets/images/driver2.png",
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
                          Divider(),
                          Text(
                            "Trip",
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    letterSpacing: 0.5),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: VerticalDivider(
                                          color: kLightGrey,
                                          thickness: 5,
                                          width: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: kLightGrey,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: VerticalDivider(
                                          color: kLightGrey,
                                          thickness: 5,
                                          width: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: kPrimaryColor,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: kLightGrey,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          color: kLightGrey,
                                          thickness: 5,
                                          width: 20,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: CircleAvatar(
                                          backgroundColor: kPrimaryColor,
                                          radius: 8,
                                          child: CircleAvatar(
                                            backgroundColor: kLightGrey,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Santa Barbara",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text("Gotham City",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text("Los Angeles International Airport",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: kPrimaryColor,
                                      size: 25,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: kPrimaryColor,
                                      size: 25,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: kPrimaryColor,
                                      size: 25,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: kPrimaryColor,
                                      size: 25,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: kPrimaryColor,
                                      size: 25,
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                ),
                                Text(
                                  "\$ 134.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
