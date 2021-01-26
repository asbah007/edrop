import 'package:aion/src/config/constants.dart';
import 'package:flutter/material.dart';

class VehicleListingCard extends StatefulWidget {
  VehicleListingCard({this.onTap});
  final Function onTap;
  @override
  _VehicleListingCardState createState() => _VehicleListingCardState();
}

class _VehicleListingCardState extends State<VehicleListingCard>
    with SingleTickerProviderStateMixin {
  double _width = 147;
  AnimationController _controller;
  bool tapEvent = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _width == 349 ? _width = 147 : _width = 349;
        setState(() {});
      },
      child: SizeTransition(
        sizeFactor: _controller,
        child: Container(
          margin: EdgeInsets.only(left: 12, bottom: 30),
          padding: EdgeInsets.only(left: 12, top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          height: 166,
          width: _width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/car.png",
                    width: 120,
                    height: 75,
                    alignment: Alignment.topLeft,
                  ),
                  Text(
                    "Hatchback",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff2f3133),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\$120.00",
                    style: TextStyle(
                      color: Color(0xff7a3dfa),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "🕑 12Min",
                        style: TextStyle(
                          color: Color(0xffadadad),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "  🧑🏻‍🤝‍🧑🏻 04",
                        style: TextStyle(
                          color: Color(0xffadadad),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              _width != 147
                  ? Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(),
                                Text(
                                  "Payment mode",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.black),
                                ),
                                GestureDetector(
                                  child: Icon(
                                    Icons.info,
                                    size: 22,
                                    color: Color(0xFFADADAD),
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20))),
                                        builder: (builder) {
                                          return new Container(
                                            height: 370.0,
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
                                                            "Trip fare",
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
                                                          Text(
                                                            "My nibh euismod tincidunt ut laoreet dolore magna aliquam erat"
                                                            " volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation"
                                                            " ullamcorper suscipit lobortis nisl ut aliquip ex ea ",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 26,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Base fare",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Text(
                                                                "\$45.00",
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Minimum fare",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Text(
                                                                "\$100.00",
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "+ Per Kilometer fare",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Text(
                                                                "\$10.00",
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Subcharges",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Text(
                                                                "\$5.00",
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff2f3133),
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.all(10),
                                  textTheme:
                                      tapEvent ? ButtonTextTheme.primary : null,
                                  height: 44,
                                  minWidth: 84,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: tapEvent
                                          ? BorderSide(color: kPrimaryColor)
                                          : BorderSide.none),
                                  color: Color(0xFFF5F5F5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons
                                          .account_balance_wallet_outlined),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Cash",
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    tapEvent
                                        ? tapEvent = false
                                        : tapEvent = true;
                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FlatButton(
                                  padding: EdgeInsets.all(10),
                                  textTheme: !tapEvent
                                      ? ButtonTextTheme.primary
                                      : null,
                                  height: 44,
                                  minWidth: 84,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: !tapEvent
                                          ? BorderSide(color: kPrimaryColor)
                                          : BorderSide.none),
                                  color: Color(0xFFF5F5F5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.book_online_outlined),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Online",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    tapEvent
                                        ? tapEvent = false
                                        : tapEvent = true;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Container(
                              width: 192,
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24.50),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(12),
                                ),
                                color: Color(0xff7a3dfa),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Text(
                                    "Next",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
