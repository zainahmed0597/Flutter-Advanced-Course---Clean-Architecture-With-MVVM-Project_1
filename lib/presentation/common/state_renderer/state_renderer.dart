import 'package:flutter/material.dart';

enum StateRendererType{

  // POPUP STATES
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  // FULL SCREEN STATES
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE, // this UI of the screen
  EMPTY_SCREEN_STATE, // empty view when we receive no data from API side for list screen
}

class ScreenRenderer extends StatelessWidget {
  const ScreenRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
