import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void updateAppState() {
    MyApp.instance.appState = 10;
  }

  void getAppState() {
    print(MyApp.instance.appState); // 10
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
