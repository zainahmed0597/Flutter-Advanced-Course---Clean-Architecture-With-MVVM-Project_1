import 'package:flutter/material.dart';
import 'package:project_1/presentation/font_manager.dart';

// regular style private
TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight,Color color) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color);
}

// light style public
TextStyle getLightStyle ({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.light,color);
}

// regular style public
TextStyle getRegularStyle ({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.regular,color);
}

// medium style public
TextStyle getMediumStyle ({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium,color);
}
// semi bold style public
TextStyle getSemiBoldStyle ({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semiBold,color);
}

// bold style public
TextStyle getBoldStyle ({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold,color);
}

