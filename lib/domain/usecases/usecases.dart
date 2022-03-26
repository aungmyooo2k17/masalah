//1
import 'package:dartz/dartz.dart';
import 'package:masalah/common/app_error.dart';

abstract class UseCase<Type, Params> {
  //2
  Future<Either<AppError, Type>> call(Params params);
}
