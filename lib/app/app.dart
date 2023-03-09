import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/app_prefs.dart';
import 'package:project_1/presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'di.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance = MyApp._internal(); // single instance -- singleton
  factory MyApp() => instance; // factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     onGenerateRoute: RouteGenerator.getRoute,
  //     initialRoute: Routes.splashRoute,
  //     theme: getApplicationTheme(),
  //     locale: context.locale,
  //     supportedLocales: flc.supportedLocales.map((e) => Locale(e)),
  //     localizationsDelegates: const [
  //       flc.CountryLocalizations.delegate,
  //       GlobalWidgetsLocalizations.delegate,
  //       GlobalMaterialLocalizations.delegate,
  //       GlobalCupertinoLocalizations.delegate,
  //     ],
  //   );
  // }
}
