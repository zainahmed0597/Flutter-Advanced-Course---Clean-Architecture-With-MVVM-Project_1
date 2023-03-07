import 'package:flutter/material.dart';
import 'package:project_1/presentation/resources/color_manager.dart';
import 'package:project_1/presentation/resources/font_manager.dart';
import 'package:project_1/presentation/resources/styles_manager.dart';
import 'package:project_1/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main color of the app
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,
    disabledColor: ColorManager.grey1,

    // ripple color
    splashColor: ColorManager.primaryOpacity70,

    // Card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      displayMedium: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      bodyMedium: getMediumStyle(color: ColorManager.lightGrey),
      displaySmall:getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      // displaySmall: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      headlineMedium:getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      titleMedium: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      titleSmall: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      bodySmall: getRegularStyle(color: ColorManager.grey1),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
    ),

    // Input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),

      // label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),

      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // border
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // disabled border
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focus border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        // focus border
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focus error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
  );
}
