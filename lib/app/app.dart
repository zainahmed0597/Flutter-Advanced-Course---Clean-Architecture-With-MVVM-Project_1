import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // const MyApp({super.key}); // default constructor

  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kp New app'),
        ),
        body: const SafeArea(
          child: Center(
            child: Text(
              'This is Google Fonts',

            ),
          ),
        ),
      ),
    );
  }
}
