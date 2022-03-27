import 'package:masalah/data/models/masalah_model.dart';
import 'package:masalah/data/core/api_client.dart';
import 'package:masalah/data/models/masalah_result_model.dart';

abstract class MasalahRemoteDataSource {
  Future<List<MasalahModel>> getMasalah();
}

class MasalahRemoteDataSourceImpl extends MasalahRemoteDataSource {
  final ApiClient _client;

  MasalahRemoteDataSourceImpl(this._client);

  @override
  Future<List<MasalahModel>> getMasalah() async {
    final response = await _client.get('/assets/masalah_data.json');
    return Future.value(MasalahResultModel.fromJson(response).items);
  }
}
