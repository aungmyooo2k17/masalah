import 'package:adhan/adhan.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:masalah/model/ui_prayer_time.dart';
import 'package:masalah/prayer_time/prayer_time_wrapper.dart';
import 'package:masalah/service/location_service.dart';

part 'prayertime_state.dart';

class PrayertimeCubit extends Cubit<PrayertimeState> {
  final PrayerTimePluginUtil prayerTimePluginUtil;

  final LocationService locationService;

  PrayertimeCubit(
      {required this.prayerTimePluginUtil, required this.locationService})
      : super(PrayertimeInitial());

  void initPrayerTime() async {
    final currentLatLng = await locationService.getCurrentLocation();
    if (currentLatLng != null) {
      prayerTimePluginUtil.init(currentLatLng);
      emit(PrayertimeInitCompleted());
    } else {
      emit(PrayerTimeInitError(error: 'Error retrieve location'));
    }
  }

  Future<UiPrayerTimeItemCard?> loadPrayerTimes() async {
    final currentLatLng = await locationService.getCurrentLocation();
    if (currentLatLng != null) {
      return prayerTimePluginUtil.getUiPrayerItemCard(
          Coordinates(currentLatLng.lat, currentLatLng.lng));
    }
    return null;
  }

  void initPrayerTimeWithOffset(DateTime date) async {
    final currentLatLng = await locationService.getCurrentLocation();

    if (currentLatLng != null) {
      final data = await prayerTimePluginUtil.initWithOffset(
          Coordinates(currentLatLng.lat, currentLatLng.lng), date);
      emit(PrayerTimeListLoaded(data: data));
    }
  }


  void toggleMuteStatus(String prayerName) {
    prayerTimePluginUtil.toogleMuteStatus(prayerName);
  }
}
