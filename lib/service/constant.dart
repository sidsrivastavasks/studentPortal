import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const bArheadingstyle = TextStyle(
  fontFamily: 'Oxygen',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
const loginTextStyle = TextStyle(
  fontFamily: 'Oxygen',
  fontSize: 17.0,
  fontWeight: FontWeight.w300,
  color: Color(0xFFFFFFFF),
);

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

const loginButtonstyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Oxygen',
  fontSize: 15.0,
);
const loginHeadingBarStyle = TextStyle(
  color: Color(0xFF424242),
  fontFamily: 'Oxygen',
  fontSize: 17.0,
  fontWeight: FontWeight.bold,
);
const registrationTextheadingstyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Oxygen',
  color: Color(0xFF424242),
);
const registrationTextstyle = TextStyle(
  fontFamily: 'Oxygen',
  color: Color(0xFFBDBDBD),
  fontSize: 17.0,
);
