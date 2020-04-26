import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorPrimary = Color(0xffF58524);
  static Color colorPrimaryDark = Color(0xffF5F0F6);
  static Color colorAccent = Color(0xff007EF4);
  static Color backgroundColor = Color(0xffF5F0F6);

  static LinearGradient blueGradient = LinearGradient(
      colors: [const Color(0xff007EF4), const Color(0xff2A75BC)]);

  static LinearGradient badamiGradient = LinearGradient(
      colors: [const Color(0xffD7B377), const Color(0xff8F754F)]);

  static LinearGradient whiteGradient = LinearGradient(
      colors: [const Color(0x1AFFFFFF), const Color(0x1AFFFFFF)],
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight);

  static InputDecoration themedecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.black54,
        fontFamily: 'OverpassRegular',
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
      ),
    );
  }

  static TextStyle inputTextStyle() {
    return TextStyle(
      color: Colors.black87,
      fontFamily: 'OverpassRegular',
    );
  }
}
