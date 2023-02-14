import 'package:dartz/dartz.dart';
import 'package:project_1/data/mapper/mapper.dart';
import 'package:project_1/data/network/failure.dart';
import 'package:project_1/data/request/request.dart';
import 'package:project_1/domain/model.dart';
import '../../domain/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // it's save to call the API
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) // success
      {
        // return data (success), return right "Authentication"
        return Right(response.toDomain());
      } else {
        // return biz logic error, return left Failure
        return Left(Failure(
            409, response.massage ?? "we have biz error logic from API side"));
      }
    } else {
      // return connection error
      return Left(Failure(501, "Please check your internet connection"));
    }
  }
}
