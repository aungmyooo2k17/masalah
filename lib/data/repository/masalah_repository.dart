import 'package:dartz/dartz.dart';
import 'package:masalah/common/app_error.dart';
import 'package:masalah/domain/entities/masalah_entity.dart';

abstract class MasalahRepository {
  Future<Either<AppError, List<MasalahEntity>>> getMasalah();
}
