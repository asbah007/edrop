import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration kTextFieldDecor({String title}) => InputDecoration(
border: InputBorder.none,
labelText: title);

BoxDecoration kContainerBorder(x)=> BoxDecoration(
  borderRadius: BorderRadius.circular(x),
color: Colors.white);