import 'package:dartz/dartz.dart';
import 'package:masalah/common/app_error.dart';
import 'package:masalah/common/no_params.dart';
import 'package:masalah/data/repository/masalah_repository.dart';
import 'package:masalah/domain/entities/masalah_entity.dart';
import 'package:masalah/domain/usecases/usecases.dart';

class GetMasalahList extends UseCase<List<MasalahEntity>, NoParams> {
  final MasalahRepository repository;

  GetMasalahList(this.repository);
  Future<Either<AppError, List<MasalahEntity>>> call(NoParams noParams) async {
    //4
    return await repository.getMasalah();
  }
}
