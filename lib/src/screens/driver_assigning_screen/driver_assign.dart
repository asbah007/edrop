import 'dart:developer';

import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/on_ride_start/on_ride_start.dart';
import 'package:aion/src/screens/on_ride_start/on_ride_start_alternative.dart';
import 'package:aion/utils/packages/ios_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DriverAssign extends StatefulWidget {
  @override
  _DriverAssignState createState() => _DriverAssignState();
}

class _DriverAssignState extends State<DriverAssign>
    with TickerProviderStateMixin {
  String _targetImageUrl;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF7A3EFB),
          Color(0xFF541EC5),
        ])),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: Text(
                "Searching For Driver",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 50,
              top: 50,
              child: Lottie.asset(
                'assets/images/lott.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller.addStatusListener((status) {
                    if (status == AnimationStatus.completed) {}
                  });

                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                bottom: 50,
                left: 30,
                right: 30,
                child: Container(
                  decoration:
                      kContainerBorder(28.5).copyWith(color: Colors.white24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Draggable<String>(
                        axis: Axis.horizontal,

                        data: "cancel",
                        childWhenDragging: SizedBox(),
                        child: Container(
                            height: 51,
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 51,
                              width: 87,
                              alignment: Alignment.center,
                              decoration: kContainerBorder(28.5),
                              child: Text("Cancel"),
                            )),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Container(
                            decoration: kContainerBorder(28.5),
                            width: 87,
                            height: 51,
                            alignment: Alignment.center,
                            child: Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.black),
                            )),
                      ),
                      DragTarget<String>(
                        onAccept: (value) {
                          Get.to(OnRideStartAlter());
                        },
                        builder: (_, candidateData, rejectedData) {
                          return Container(
                            height: 51,
                            decoration: kContainerBorder(28.5)
                                .copyWith(color: Colors.transparent),
                            alignment: Alignment.center,
                            child: _targetImageUrl != null
                                ? Text(_targetImageUrl)
                                : Text(
                                    "Swipe ->    ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: Colors.black38),
                                  ),
                          );
                        },
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
