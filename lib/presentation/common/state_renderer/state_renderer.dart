import 'package:flutter/material.dart';
import 'package:project_1/data/mapper/mapper.dart';
import 'package:project_1/presentation/resources/strings_manager.dart';
import '../../../data/network/failure.dart';

enum StateRendererType {
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
  StateRendererType stateRendererType;
  Failure failure;
  String message;
  String title;
  Function retryActionFunction;

  ScreenRenderer(
      {Key? key,
      required this.stateRendererType,
      Failure? failure,
      String? message,
      String? title,
      required this.retryActionFunction})
      : message = message ?? AppStrings.loading,
        title = title ?? EMPTY,
        failure = failure ?? DefaultFailure(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _getStateWidget(){
    switch(stateRendererType){
      case StateRendererType.POPUP_LOADING_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.POPUP_ERROR_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.CONTENT_SCREEN_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.EMPTY_SCREEN_STATE:
        // TODO: Handle this case.
        break;
      default:
        Container();
    }

  }
}
