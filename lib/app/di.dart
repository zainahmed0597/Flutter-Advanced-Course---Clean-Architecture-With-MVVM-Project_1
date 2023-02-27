import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_1/app/app_prefs.dart';
import 'package:project_1/data/data_source/remote_data_source.dart';
import 'package:project_1/data/network/app_api.dart';
import 'package:project_1/data/network/dio_factory.dart';
import 'package:project_1/data/repository/repository_impl.dart';
import 'package:project_1/domain/repository/repository.dart';
import 'package:project_1/domain/usecase/login_usecase.dart';
import 'package:project_1/domain/usecase/register_usecase.dart';
import 'package:project_1/presentation/login/login_viewmodel.dart';
import 'package:project_1/presentation/register/register_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/network/network_info.dart';
import '../domain/usecase/forget_password_usecase.dart';
import '../presentation/forget_password/forget_password_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourseImplementer(instance()));
  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
            () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
            () => ForgotPasswordViewModel(instance()));
  }
}
initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
            () => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
            () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(
            () => ImagePicker());
  }
}
