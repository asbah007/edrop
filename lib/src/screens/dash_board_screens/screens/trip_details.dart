import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripDetails extends StatefulWidget {
  @override
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Trip id : 1826844",
            style: _theme.headline5.copyWith(color: Colors.black)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            decoration: kContainerBorder(10.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 50, top: 20),
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            alignment: Alignment.bottomCenter,
            decoration: kContainerBorder(10.0).copyWith(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/bg_trip_summary.png"))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Time",
                      style: _theme.headline6,
                    ),
                    Text(
                      "25 min",
                      style: _theme.headline3,
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Distances",
                      style: _theme.headline6,
                    ),
                    Text(
                      "18 km",
                      style: _theme.headline3,
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Trip fare",
                      style: _theme.headline6,
                    ),
                    Text(
                      "\$245.00",
                      style: _theme.headline3,
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: kContainerBorder(12.0),
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trip",
                  style: _theme.headline3.copyWith(
                      color: Colors.black, fontSize: 14, letterSpacing: 0.5),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Santa Barbara",
                          style: _theme.subtitle1,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text("Gotham City", style: _theme.subtitle1),
                        SizedBox(
                          height: 6,
                        ),
                        Text("Los Angeles International Airport",
                            style: _theme.subtitle1),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: kContainerBorder(12.0),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Receipt",
                    style: _theme.headline3.copyWith(
                        color: Colors.black, fontSize: 14, letterSpacing: 0.5)),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trip fare", style: _theme.subtitle1),
                    Text("\$200.00",
                        textAlign: TextAlign.right, style: _theme.subtitle1),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tolls & Surcharges", style: _theme.subtitle1),
                    Text("\$15.00",
                        textAlign: TextAlign.right, style: _theme.subtitle1),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Wait time (15 min)", style: _theme.subtitle1),
                    Text("\$10.00",
                        textAlign: TextAlign.right, style: _theme.subtitle1),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Taxes", style: _theme.subtitle1),
                    Text(
                      "\$5.00",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff2f3133),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                        style: _theme.subtitle1.copyWith(color: kPrimaryColor)),
                    Text("\$230 .00",
                        style: _theme.subtitle1.copyWith(color: kPrimaryColor)),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment",
                        style: _theme.subtitle1.copyWith(color: Colors.black)),
                    Text("Cash",
                        style: _theme.subtitle1.copyWith(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: FlatButton(
              color: Colors.white,
              minWidth: double.infinity,
              height: 52,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rounded),
                  Text(
                    "  Add Rating",
                    style: _theme.headline6.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
