import '../../data/network/failure.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase extends BaseUseCase<void, HomeObject> {
  Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHome();
  }
}
