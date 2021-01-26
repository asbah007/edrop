import 'package:flutter/material.dart';

Widget kPrimaryButton({Color color, String title, Function onTap}) =>
    FlatButton(
      height: 54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
