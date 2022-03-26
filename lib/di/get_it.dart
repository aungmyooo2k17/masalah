import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:masalah/data/core/api_client.dart';
import 'package:masalah/data/data_sources/masalah_remote_data_source.dart';
import 'package:masalah/data/repository/masalah_repository.dart';
import 'package:masalah/data/repository/masalah_repository_impl.dart';
import 'package:masalah/domain/usecases/get_masalahlist.dart';
import 'package:masalah/presentation/blocs/masalahlist/masalahlist_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MasalahRemoteDataSource>(
      () => MasalahRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetMasalahList>(
      () => GetMasalahList(getItInstance()));
  getItInstance.registerLazySingleton<MasalahRepository>(
      () => MasalahRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(
      () => MasalahlistBloc(getMasalahList: GetMasalahList(getItInstance())));
}
