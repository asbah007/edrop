import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripSummary extends StatefulWidget {
  @override
  _TripSummaryState createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.offAll(HomePage(),
                transition: Transition.downToUp, arguments: true);
          },
          isExtended: true,
          label: Text(
            "Pay",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
          backgroundColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text("Trip Summary",
            style: _theme.headline5.copyWith(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 100),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: FlatButton(
              color: Colors.white,
              minWidth: double.infinity,
              height: 52,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (builder) {
                      return new Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0))),
                          child: Column(
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
                                    "Apply Coupon",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: kContainerBorder(10.0).copyWith(
                                  color: Color(0xffF7F7F7),
                                ),
                                child: TextField(
                                  decoration: kTextFieldDecor(
                                          title: "Enter Coupon Code")
                                      .copyWith(
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: FlatButton(
                                  height: 50,
                                  minWidth: double.infinity,
                                  child: Text("Confirm",
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
                              )
                            ],
                          ));
                    });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Apply Coupon",
                style: _theme.subtitle1.copyWith(color: kPrimaryColor),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: kContainerBorder(12.0),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Tips",
                    style: _theme.headline3.copyWith(
                        color: Colors.black, fontSize: 14, letterSpacing: 0.5)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => index != 4
                        ? Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: FlatButton(
                              color: kSecondaryColor,
                              minWidth: 52,
                              height: 52,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "\$ ${(index + 1) * 5}.0",
                                style: _theme.subtitle1
                                    .copyWith(color: kPrimaryColor),
                              ),
                            ),
                          )
                        : Container(
                            height: 52,
                            width: 85,
                            decoration: kContainerBorder(10.0).copyWith(
                              color: Color(0xffF7F7F7),
                            ),
                            child: TextField(
                              decoration:
                                  kTextFieldDecor(title: "Amount").copyWith(
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
