import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.formHex("#ED9728");
  static Color darkGrey =  HexColor.formHex("#525252");
  static Color grey =  HexColor.formHex("#737477");
  static Color lightGrey =  HexColor.formHex("#9E9E9E");
  static Color primaryOpacity70 =  HexColor.formHex("#B3ED9728");

  // new colors
  static Color dartPrimary =  HexColor.formHex("#d17d11");
  static Color grey1 =  HexColor.formHex("#707070");
  static Color grey2 =  HexColor.formHex("#797979");
  static Color white =  HexColor.formHex("#FFFFFF");
  static Color error =  HexColor.formHex("#e61f34"); // red color
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