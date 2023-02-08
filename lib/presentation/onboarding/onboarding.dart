import 'package:flutter/material.dart';
import 'package:project_1/presentation/resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: const Text('On Boarding View '),
      ),
      body: const Center(
        child: Text('On Boarding View'),
      ),
    );
  }
}
