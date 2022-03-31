part of 'masalah_category_list_bloc.dart';

abstract class MasalahCategoryListState extends Equatable {
  const MasalahCategoryListState();

  @override
  List<Object> get props => [];
}

class MasalahCategoryListInitial extends MasalahCategoryListState {}

class MasalahCategoryListError extends MasalahCategoryListState {}

class MasalahCategoryListLoaded extends MasalahCategoryListState {
  final List<MasalahCategoryEntity> masalahs;

  const MasalahCategoryListLoaded(this.masalahs);

  @override
  List<Object> get props => [masalahs];
}
