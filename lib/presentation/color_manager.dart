import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.formHex("#ED9728");
  static Color darkGrey =  HexColor.formHex("#525252");
  static Color grey =  HexColor.formHex("#737477");
  static Color lightGrey =  HexColor.formHex("#9E9E9E");
  static Color primaryOpacity70 =  HexColor.formHex("#B3ED9728");
}

extension HexColor on Color {
  static Color formHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString == 'FF $hexColorString';  // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}