import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/custom_icon.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/dash_board_screens/screens/add_google_point.dart';
import 'package:aion/src/screens/home/home_page.dart';
import 'package:aion/src/screens/vehicle_list/vehicle-listing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        child: FloatingActionButton.extended(
          label: Text(
            "Confirm",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
          onPressed: () {
            bool _pressed = false;
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0))),
                backgroundColor: Colors.white,
                context: context,
                isScrollControlled: true,
                builder: (context) => StatefulBuilder(
                      builder: (context, setState) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
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
                                _pressed
                                    ? "Save Location"
                                    : "Do you want to save this location ?",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          _pressed
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 16),
                                  decoration: kContainerBorder(10.0).copyWith(
                                    color: Color(0xffF7F7F7),
                                  ),
                                  child: TextField(
                                    // autofocus: true,
                                    decoration: kTextFieldDecor(
                                        title: "Starting Point"),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 16),
                                  child: FlatButton(
                                    height: 50,
                                    minWidth: double.infinity,
                                    child: Text("Yes, Save",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(color: Colors.white)),
                                    onPressed: () {
                                      setState(() {
                                        _pressed = true;
                                      });
                                    },
                                    color: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: FlatButton(
                              height: 50,
                              color:
                                  _pressed ? kPrimaryColor : Color(0xFFF2F2F2),
                              minWidth: double.infinity,
                              child: Text(
                                _pressed ? "Save" : "No",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: _pressed
                                            ? Color(0xFFF2F2F2)
                                            : kPrimaryColor),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Get.to(VehicleListing());
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ));
          },
          backgroundColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlineButton(
                padding: EdgeInsets.only(left: 5),
                borderSide: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (builder) {
                        return new Container(
                          height: 600.0,
                          color: Color(0xFF737373),
                          child: new Container(
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0))),
                              child: Column(
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
                                        "Schedule Your Trip",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: kContainerBorder(15.0).copyWith(
                                      color: Color(0xffF7F7F7),
                                    ),
                                    child: CalendarDatePicker(
                                      firstDate: DateTime(2020),
                                      currentDate: DateTime.now(),
                                      initialDate: DateTime(2020),
                                      lastDate: DateTime(2040),
                                      onDateChanged: (dateVale) {
                                        print(dateVale);
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    decoration: kContainerBorder(15.0).copyWith(
                                      color: Color(0xffF7F7F7),
                                    ),
                                    child: CupertinoTimerPicker(
                                      mode: CupertinoTimerPickerMode.hm,
                                      initialTimerDuration: Duration(
                                          hours: DateTime.now().hour,
                                          minutes: DateTime.now().minute),
                                      onTimerDurationChanged: (data) {
                                        print(data);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  )
                                ],
                              )),
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      HomeIcons.frame_5,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Now",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                )),
          )
        ],
        bottom: PreferredSize(
          child: Container(
            width: 500,
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            decoration: kContainerBorder(10.0),
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
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        height: 48,
                        decoration: kContainerBorder(10.0).copyWith(
                          color: Color(0xffF7F7F7),
                        ),
                        child: TextField(
                          decoration: kTextFieldDecor(title: "Starting Point"),
                        ),
                      ),
                      Container(
                        height: 48,
                        decoration: kContainerBorder(10.0).copyWith(
                          color: Color(0xffF7F7F7),
                        ),
                        child: TextField(
                          decoration: kTextFieldDecor(title: "Destination"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(150),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 7, top: 25),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              "Recent Search",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              children: [
                Chip(
                  label: Text("Washington"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                Chip(
                  label: Text("California"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                Chip(
                  label: Text("Arizona"),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 10, bottom: 5),
            child: Text(
              "Bookmarks",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
          ),
          ListTile(
            leading: Container(
              child: Icon(
                HomeIcons.frame_8,
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
                HomeIcons.frame_8,
                color: Colors.black,
              ),
              padding: EdgeInsets.all(10),
              decoration: kContainerBorder(10.0),
            ),
            title: Text("Collage"),
            subtitle: Text("3288 Foresston Road"),
          ),
          ListTile(
            leading: Container(
              child: Icon(
                HomeIcons.frame_8,
                color: Colors.black,
              ),
              padding: EdgeInsets.all(10),
              decoration: kContainerBorder(10.0),
            ),
            title: Text("Office"),
            subtitle: Text("3369 Bridge Avenue Jadewood farms"),
          ),
          GestureDetector(
            onTap: () {
              Get.to(AddBookMarkOnMap());
            },
            child: Container(
              height: 53,
              decoration: kContainerBorder(10.0),
              margin: EdgeInsets.all(13),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      HomeIcons.frame_6,
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
