part of 'prayertime_cubit.dart';

abstract class PrayertimeState extends Equatable {
  const PrayertimeState();

  @override
  List<Object> get props => [];
}

class PrayertimeInitial extends PrayertimeState {}


class PrayertimeInitCompleted extends PrayertimeState {}

class PrayerTimeInitError extends PrayertimeState{
  final String error;

  PrayerTimeInitError({required this.error});


  @override
  List<Object> get props => [error];
}
