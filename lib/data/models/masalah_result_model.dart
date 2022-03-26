import 'package:masalah/data/models/masalah_model.dart';

class MasalahResultModel {
  List<MasalahModel>? items;

  MasalahResultModel({this.items});

  MasalahResultModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <MasalahModel>[];
      json['items'].forEach((v) {
        print("*****");
        items!.add(new MasalahModel.fromJson(v));
      });
    } else {
      print("*****");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      print("*****");
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
