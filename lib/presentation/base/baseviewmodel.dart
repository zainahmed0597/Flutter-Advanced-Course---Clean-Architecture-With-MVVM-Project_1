abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutput{
  // share variables and functions that will be use through any view model.
}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewmodel dies.
}

abstract class BaseViewModelOutput {}
