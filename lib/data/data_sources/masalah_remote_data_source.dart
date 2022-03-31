import 'package:masalah/data/models/masalah_category_model.dart';
import 'package:masalah/data/models/masalah_category_result_model.dart';
import 'package:masalah/data/models/masalah_model.dart';
import 'package:masalah/data/core/api_client.dart';
import 'package:masalah/data/models/masalah_result_model.dart';

abstract class MasalahRemoteDataSource {
  Future<List<MasalahModel>> getMasalah();
  Future<List<MasalahCategoryModel>> getMasalahCategory();
}

class MasalahRemoteDataSourceImpl extends MasalahRemoteDataSource {
  final ApiClient _client;

  MasalahRemoteDataSourceImpl(this._client);

  @override
  Future<List<MasalahModel>> getMasalah() async {
    final response = await _client.get('/assets/masalah_data.json');
    return Future.value(MasalahResultModel.fromJson(response).items);
  }

  @override
  Future<List<MasalahCategoryModel>> getMasalahCategory() async {
    final response = await _client.get('/assets/masalah_categories.json');
    print(response);
    return Future.value(MasalahCategoryResultModel.fromJson(response).items);
  }
}
