import 'package:project_1/presentation/common/state_renderer/state_renderer.dart';
import 'package:project_1/presentation/resources/strings_manager.dart';

abstract class FlowState{
  StateRendererType getStateRendererType();
  String getMessage();
}

// Loading State (POPUP, FULL SCREEN)

class LoadingState extends FlowState{
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType,  String? message}) :
  message = message ?? AppStrings.loading;

  @override
  String getMessage() {
    // TODO: implement getMessage
    throw UnimplementedError();
  }

  @override
  StateRendererType getStateRendererType() {
    // TODO: implement stateRendererType
    throw UnimplementedError();
  }

}