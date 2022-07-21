import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimary = Color.fromARGB(255, 142, 151, 253);
const kColorLightYellow = Color.fromARGB(255, 255, 236, 204);
const kColorLightGrey = Color.fromARGB(255, 235, 234, 236);
const kColorDarkGrey = Color.fromARGB(255, 63, 65, 78);
const kColorGrey = Color.fromARGB(255, 161, 164, 178);

class PrimaryFont {
  static TextStyle medium(double size) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: size,
    );
  }

  static TextStyle thin(double size) {
    return TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: size,
    );
  }

  static TextStyle light(double size){
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: size,
    );
  }

  static TextStyle bold(double size){
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: size,
    );
  }
}

extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}
