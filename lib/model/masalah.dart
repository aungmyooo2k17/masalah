import 'dart:convert';

Masalah imgFromJson(String str) => Masalah.fromJson(json.decode(str));
String imgToJson(Masalah data) => json.encode(data.toJson());

class Masalah {
  final int? masalahId;
  final String? masalahTitle;
  final String? masalahDescription;
  final String? masalahRefrence;
  final int? masalahCategoryId;

  Masalah(
      {this.masalahId,
      this.masalahTitle,
      this.masalahDescription,
      this.masalahRefrence,
      this.masalahCategoryId});

  factory Masalah.fromJson(Map<String, dynamic> json) => Masalah(
      masalahId: json["masalahId"],
      masalahTitle: json["masalahTitle"],
      masalahDescription: json["masalahDescription"],
      masalahRefrence: json["masalahRefrence"],
      masalahCategoryId: json["categoryId"]);

  Map<String, dynamic> toJson() => {
        "masalahId": masalahId,
        "masalahTitle": masalahTitle,
        "masalahDescription": masalahDescription,
        "masalahRefrence": masalahRefrence,
        "categoryId": masalahCategoryId
      };
}

class MasalahApi {
  final List<Masalah>? masalahs; // 1
  final int? numberOfElements;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;

  MasalahApi(
      {this.masalahs,
      this.numberOfElements,
      this.pageNumber,
      this.pageSize,
      this.totalElements,
      this.totalPages});

  factory MasalahApi.fromRawJson(String str) =>
      MasalahApi.fromJson(json.decode(str)); // 2

  factory MasalahApi.fromJson(Map<String, dynamic> json) => MasalahApi(
      masalahs:
          List<Masalah>.from(json["items"].map((x) => Masalah.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(masalahs!.map((x) => x.toJson())),
      };
}
