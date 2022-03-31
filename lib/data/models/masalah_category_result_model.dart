import 'masalah_category_model.dart';

class MasalahCategoryResultModel {
  List<MasalahCategoryModel>? items;

  MasalahCategoryResultModel({this.items});

  MasalahCategoryResultModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <MasalahCategoryModel>[];
      json['items'].forEach((v) {
        items!.add(new MasalahCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
