part of 'masalahlist_bloc.dart';

abstract class MasalahlistEvent extends Equatable {
  const MasalahlistEvent();

  @override
  List<Object> get props => [];
}

class MasalahListLoadEvent extends MasalahlistEvent {
  const MasalahListLoadEvent();

  @override
  List<Object> get props => [];
}
