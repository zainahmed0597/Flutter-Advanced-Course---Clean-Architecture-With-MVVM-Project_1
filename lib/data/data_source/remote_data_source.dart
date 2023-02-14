import 'package:project_1/data/request/request.dart';
import 'package:project_1/data/responses/responses.dart';

import '../network/app_api.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourseImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourseImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email,
        loginRequest.password, loginRequest.imei, loginRequest.deviceType);
  }
}
