import 'package:equatable/equatable.dart';

class MasalahCategoryEntity extends Equatable {
  final int categoryId;
  final String categoryName;
  final int masalahCount;

  MasalahCategoryEntity(
      {required this.categoryId,
      required this.categoryName,
      required this.masalahCount});

  @override
  List<Object> get props => [categoryId, categoryName];

  @override
  bool get stringify => true;
}
