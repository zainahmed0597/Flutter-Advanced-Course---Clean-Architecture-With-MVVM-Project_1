import 'package:flutter/material.dart';
import 'package:project_1/presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance = MyApp._internal(); // single instance -- singleton
  factory MyApp() => instance; // factory for the class instance
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),

      supportedLocales: flc.supportedLocales.map((e) => Locale(e)),
      localizationsDelegates: const [
        flc.CountryLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
