import 'dart:async';
import 'dart:ffi';
import '../../../domain/model/model.dart';
import 'package:project_1/domain/usecase/home_usecase.dart';
import 'package:project_1/presentation/base/baseviewmodel.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput,HomeViewModelOutput{
  HomeUseCase _homeUseCase;

  StreamController _bannerStreamController = BehaviorSubject<List<BannerAd>>();
  StreamController _servicesStreamController = BehaviorSubject<List<Service>>();
  StreamController _storesStreamController = BehaviorSubject<List<Store>>();
  HomeViewModel(this._homeUseCase);

  // Inputs
  @override
  void start() {
    _getHome();
  }
  _getHome() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await _homeUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    },(homeObject){
      inputState.add(ContentState());
      inputBanners.add(homeObject.data.banners);
      inputServices.add(homeObject.data.services);
      inputStore.add(homeObject.data.stores);
    });
  }

  @override
  void dispose() {
    _bannerStreamController.close();
    _servicesStreamController.close();
    _storesStreamController.close();
    super.dispose();
  }


  @override
  Sink get inputBanners => _bannerStreamController.sink;

  @override
  Sink get inputServices => _servicesStreamController.sink;

  @override
  Sink get inputStore => _storesStreamController.sink;

  // Outputs
  @override
  Stream<List<BannerAd>> get outputBanners => _bannerStreamController.stream.map((banners) => banners);

  @override
  // TODO: implement outputServices
  Stream<List<Service>> get outputServices => _servicesStreamController.stream.map((services) => services);

  @override
  // TODO: implement outputStores
  Stream<List<Store>> get outputStores => _storesStreamController.stream.map((stores) => stores);
}

abstract class HomeViewModelInput{
  Sink get inputBanners;
  Sink get inputServices;
  Sink get inputStore;
}
abstract class HomeViewModelOutput{
  Stream<List<BannerAd>> get outputBanners;
  Stream<List<Service>> get outputServices;
  Stream<List<Store>> get outputStores;
}
