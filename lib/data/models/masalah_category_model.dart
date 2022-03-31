import 'package:masalah/domain/entities/masalah_category_entity.dart';
import 'package:masalah/domain/entities/masalah_entity.dart';

class MasalahCategoryModel extends MasalahCategoryEntity {
  final int categoryId;
  final String categoryName;
  final int masalahCount;

  MasalahCategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.masalahCount})
      : super(
            categoryId: categoryId,
            categoryName: categoryName,
            masalahCount: masalahCount);

  factory MasalahCategoryModel.fromJson(Map<String, dynamic> json) {
    return MasalahCategoryModel(
        categoryId: json['categoryId'],
        categoryName: json['categoryName'],
        masalahCount: json['masalahCount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['masalahCount'] = this.masalahCount;
    return data;
  }
}
