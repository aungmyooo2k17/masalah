import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:masalah/common/no_params.dart';
import 'package:masalah/domain/entities/masalah_entity.dart';
import 'package:masalah/domain/usecases/get_masalahlist.dart';

part 'masalahlist_event.dart';
part 'masalahlist_state.dart';

class MasalahlistBloc extends Bloc<MasalahlistEvent, MasalahlistState> {
  final GetMasalahList getMasalahList;

  MasalahlistBloc({required this.getMasalahList}) : super(MasalahlistInitial());

  @override
  Stream<MasalahlistState> mapEventToState(
    MasalahlistEvent event,
  ) async* {
    if (event is MasalahListLoadEvent) {
      final itemsEither = await getMasalahList(NoParams());
      yield itemsEither.fold(
        (l) => MasalahlistError(),
        (items) {
          return MasalahlistLoaded(items);
        },
      );
    }
  }
}
