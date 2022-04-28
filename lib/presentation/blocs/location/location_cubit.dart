import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:masalah/presentation/blocs/prayertime/prayertime_cubit.dart';
import 'package:masalah/service/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService locationService;
  final PrayertimeCubit prayertimeCubit;
  LocationCubit({required this.locationService, required this.prayertimeCubit})
      : super(LocationInitial());

  void loadLocation() async {
    final currentLatLng = await locationService.getCurrentLocation();
    if (currentLatLng != null) {
      emit(LocationLoaded(currentLatLng: currentLatLng));
    }
  }

  // void loadPrayerTimeForLocation() async {
  //   final currentLatLng = await locationService.getCurrentLocation();
  //   if (currentLatLng != null) {
  //     prayertimeCubit.initPrayerTime(currentLatLng);
  //   }
  // }
}
