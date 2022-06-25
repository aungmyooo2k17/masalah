part of 'prayertime_cubit.dart';

abstract class PrayertimeState extends Equatable {
  const PrayertimeState();

  @override
  List<Object> get props => [];
}

class PrayertimeInitial extends PrayertimeState {}

class PrayerTimeListLoaded extends PrayertimeState {
  final List<UiPrayerTimeItem> data;

  PrayerTimeListLoaded({required this.data}):super();

  @override
  List<Object> get props => [data];
}




class PrayertimeInitCompleted extends PrayertimeState {}

class PrayerTimeInitError extends PrayertimeState{
  final String error;

  PrayerTimeInitError({required this.error});


  @override
  List<Object> get props => [error];
}
