import 'package:masalah/domain/entities/masalah_entity.dart';

class MasalahModel extends MasalahEntity {
  final int masalahId;
  final String masalahTitle;
  final String masalahDescription;
  final String masalahRefrence;
  final int categoryId;

  MasalahModel(
      {required this.masalahId,
      required this.masalahTitle,
      required this.masalahDescription,
      required this.masalahRefrence,
      required this.categoryId})
      : super(
            masalahId: masalahId,
            masalahTitle: masalahTitle,
            masalahDescription: masalahDescription,
            masalahRefrence: masalahRefrence,
            categoryId: categoryId);

  factory MasalahModel.fromJson(Map<String, dynamic> json) {
    return MasalahModel(
        masalahId: json['masalahId'],
        masalahTitle: json['masalahTitle'],
        masalahDescription: json['masalahDescription'],
        masalahRefrence: json['masalahRefrence'],
        categoryId: json['categoryId']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masalahId'] = this.masalahId;
    data['masalahTitle'] = this.masalahTitle;
    data['masalahDescription'] = this.masalahDescription;
    data['masalahRefrence'] = this.masalahRefrence;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
