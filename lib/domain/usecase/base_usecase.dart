import 'package:dartz/dartz.dart';
import 'package:project_1/data/network/failure.dart';

abstract class BaseUseCase<In,Out>{
  Future<Either<Failure,Out>> execute(In input);
}