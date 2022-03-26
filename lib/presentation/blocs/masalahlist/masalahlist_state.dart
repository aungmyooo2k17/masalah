part of 'masalahlist_bloc.dart';

abstract class MasalahlistState extends Equatable {
  const MasalahlistState();

  @override
  List<Object> get props => [];
}

class MasalahlistInitial extends MasalahlistState {}

class MasalahlistError extends MasalahlistState {}

class MasalahlistLoaded extends MasalahlistState {
  final List<MasalahEntity> masalahs;

  const MasalahlistLoaded(this.masalahs);

  @override
  List<Object> get props => [masalahs];
}
