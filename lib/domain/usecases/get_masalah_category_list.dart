import 'package:dartz/dartz.dart';
import 'package:masalah/common/app_error.dart';
import 'package:masalah/common/no_params.dart';
import 'package:masalah/data/models/masalah_category_model.dart';
import 'package:masalah/data/repository/masalah_repository.dart';
import 'package:masalah/domain/entities/masalah_category_entity.dart';
import 'package:masalah/domain/usecases/usecases.dart';

class GetMasalahCategoryList
    extends UseCase<List<MasalahCategoryEntity>, NoParams> {
  final MasalahRepository repository;

  GetMasalahCategoryList(this.repository);
  Future<Either<AppError, List<MasalahCategoryEntity>>> call(
      NoParams noParams) async {
    //4
    return await repository.getMasalahCategory();
  }
}
