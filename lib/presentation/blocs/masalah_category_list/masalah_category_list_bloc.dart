import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:masalah/data/models/masalah_category_model.dart';
import 'package:masalah/domain/entities/masalah_category_entity.dart';
import 'package:masalah/domain/usecases/get_masalah_category_list.dart';

import '../../../common/no_params.dart';

part 'masalah_category_list_event.dart';
part 'masalah_category_list_state.dart';

class MasalahCategoryListBloc
    extends Bloc<MasalahCategoryListEvent, MasalahCategoryListState> {
  final GetMasalahCategoryList getMasalahCategoryList;
  MasalahCategoryListBloc({required this.getMasalahCategoryList})
      : super(MasalahCategoryListInitial());

  @override
  Stream<MasalahCategoryListState> mapEventToState(
    MasalahCategoryListEvent event,
  ) async* {
    print("^^^");
    print(event);
    if (event is MasalahCategoryListLoaded) {
      print("ui");
      final itemsEither = await getMasalahCategoryList(NoParams());
      print("hello");
      print(itemsEither);
      yield itemsEither.fold(
        (l) => MasalahCategoryListError(),
        (items) {
          return MasalahCategoryListLoaded(items);
        },
      );
    }
  }
}
