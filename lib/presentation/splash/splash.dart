import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_1/presentation/resources/color_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;
  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }
  _goNext(){
    Navigator.pushReplacementNamed(context,Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
