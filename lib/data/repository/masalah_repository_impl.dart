import 'package:masalah/common/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:masalah/data/data_sources/masalah_remote_data_source.dart';
import 'package:masalah/data/models/masalah_category_model.dart';
import 'package:masalah/data/models/masalah_model.dart';
import 'package:masalah/data/repository/masalah_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../data_sources/masalah_local_data_source.dart';

class MasalahRepositoryImpl extends MasalahRepository {
  final MasalahRemoteDataSource remoteDataSource;

  MasalahRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MasalahModel>>> getMasalah() async {
    // try {
    //   final items = await remoteDataSource.getMasalah();
    //   return Right(items);
    // } on Exception catch (error) {
    //   return Left(AppError(error.toString()));
    // }

    final dbHelper = DatabaseHelper.instance;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a network.
      try {
        final items = await remoteDataSource.getMasalah();
        items.forEach((element) async {
          Map<String, dynamic> row = {
            DatabaseHelper.masalahId: element.masalahId,
            DatabaseHelper.masalahTitle: element.masalahTitle,
            DatabaseHelper.masalahDescription: element.masalahDescription,
            DatabaseHelper.masalahRefrence: element.masalahRefrence,
            DatabaseHelper.masalahCategoryId: 1,
          };
          await dbHelper.insertMasalah(row);
        });
        return Right(items);
      } on Exception catch (error) {
        return Left(AppError(error.toString()));
      }
    } else {
      // I am disconnected to a network.
      try {
        // final items = await dbHelper.getMasalahRows();
        return Right([]);
      } on Exception catch (error) {
        return Left(AppError(error.toString()));
      }
    }
  }

  @override
  Future<Either<AppError, List<MasalahCategoryModel>>>
      getMasalahCategory() async {
    final dbHelper = DatabaseHelper.instance;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a network.
      try {
        final items = await remoteDataSource.getMasalahCategory();

        items.forEach((element) async {
          Map<String, dynamic> row = {
            DatabaseHelper.categoryName: element.categoryName,
            DatabaseHelper.categoryId: element.categoryId,
            DatabaseHelper.masalahCount: element.masalahCount,
          };
          await dbHelper.insertCategory(row);
        });
        return Right(items);
      } on Exception catch (error) {
        return Left(AppError(error.toString()));
      }
    } else {
      // I am disconnected to a network.
      try {
        final items = await dbHelper.getCategoryRows();

        return Right(items);
      } on Exception catch (error) {
        return Left(AppError(error.toString()));
      }
    }
  }
}
