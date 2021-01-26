import 'package:flutter/material.dart';

InputDecoration kTextFieldDecor({String title}) => InputDecoration(
    contentPadding: EdgeInsets.only(left: 10, bottom: 15),
    border: InputBorder.none,
    labelText: title);

BoxDecoration kContainerBorder(x) =>
    BoxDecoration(borderRadius: BorderRadius.circular(x), color: Colors.white);
