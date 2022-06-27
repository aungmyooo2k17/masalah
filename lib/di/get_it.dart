import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/presentation/blocs/location/location_cubit.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/service/location_service.dart';

import '../presentation/blocs/language/language_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  getItInstance.registerSingleton<PrayerTimePluginUtil>(PrayerTimePluginUtil());
  getItInstance.registerSingleton<LocationService>(LocationServiceImpl());

  getItInstance.registerSingleton<PrayertimeCubit>(PrayertimeCubit(
      prayerTimePluginUtil: getItInstance(), locationService: getItInstance()));

  getItInstance.registerSingleton<LocationCubit>(LocationCubit(
      locationService: getItInstance(), prayertimeCubit: getItInstance()));

}
