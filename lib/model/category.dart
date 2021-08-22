import 'dart:convert';

Category imgFromJson(String str) => Category.fromJson(json.decode(str));
String imgToJson(Category data) => json.encode(data.toJson());

class Category {
  final String? categoryName;
  final int? categoryId;
  final int? masalahCount;

  Category({this.categoryName, this.categoryId, this.masalahCount});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      masalahCount: json["masalahCount"]);

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "masalahCount": masalahCount
      };
}

class CategoryApi {
  final List<Category>? categories; // 1
  final int? numberOfElements;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;

  CategoryApi(
      {this.categories,
      this.numberOfElements,
      this.pageNumber,
      this.pageSize,
      this.totalElements,
      this.totalPages});

  factory CategoryApi.fromRawJson(String str) =>
      CategoryApi.fromJson(json.decode(str)); // 2

  factory CategoryApi.fromJson(Map<String, dynamic> json) => CategoryApi(
      categories:
          List<Category>.from(json["items"].map((x) => Category.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}
