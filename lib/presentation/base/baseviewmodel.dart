import 'dart:async';
import 'package:project_1/presentation/common/state_renderer/state_render_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutput {
  StreamController _inputStateStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((FlowState) => FlowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }

// share variables and functions that will be use through any view model.
}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewmodel dies.

  Sink get inputState;
}

abstract class BaseViewModelOutput {
  Stream<FlowState> get outputState;
}
