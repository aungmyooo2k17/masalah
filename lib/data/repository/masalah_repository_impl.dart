import 'package:masalah/common/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:masalah/data/data_sources/masalah_remote_data_source.dart';
import 'package:masalah/data/models/masalah_model.dart';
import 'package:masalah/data/repository/masalah_repository.dart';
import 'package:masalah/domain/entities/masalah_entity.dart';

class MasalahRepositoryImpl extends MasalahRepository {
  final MasalahRemoteDataSource remoteDataSource;

  MasalahRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MasalahModel>>> getMasalah() async {
    try {
      final items = await remoteDataSource.getMasalah();
      return Right(items);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }
}
