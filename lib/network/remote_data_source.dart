import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:masalah/model/category.dart';
import 'package:masalah/model/masalah.dart';
import 'package:masalah/model/result.dart';
import 'package:masalah/network/api_client.dart';

class RemoteDataSource {
  RemoteDataSource._privateConstructor();
  static final RemoteDataSource _apiResponse =
      RemoteDataSource._privateConstructor();
  factory RemoteDataSource() => _apiResponse;

  ApiClient client = ApiClient(Client());

  Future<Result> getCategories() async {
    try {
      //2
      final response = await client.request(
          requestType: RequestType.GET, path: "assets/masalah_categories.json");
      print("***************");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("networkingggg");
        CategoryApi data = CategoryApi.fromRawJson(response.body);

        return Result<List<Category>>.success(data.categories!);
      } else {
        return Result.error("Category list not available");
      }
    } catch (error) {
      return Result.error("Something went wrong!\n$error");
    }
  }

  Future<Result> getMasalahs() async {
    try {
      //2
      final response = await client.request(
          requestType: RequestType.GET, path: "assets/masalah_data.json");
      print("***************");
      print(response.statusCode);
      if (response.statusCode == 200) {
        MasalahApi data = MasalahApi.fromRawJson(response.body);
        return Result<List<Masalah>>.success(data.masalahs!);
      } else {
        return Result.error("Masalahs list not available");
      }
    } catch (error) {
      return Result.error("Something went wrong!\n$error");
    }
  }
}
