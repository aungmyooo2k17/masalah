import 'package:http/http.dart' as http;
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

      if (response.statusCode == 200) {
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

  Future<String> getUSDRate() async {
    try {
      final response =
          await http.get(Uri.parse('https://forex.cbm.gov.mm/api/latest'));

      var rs = jsonDecode(response.body);
      var usd = rs['rates']['USD'];

      print('getusddd');
      print(usd);
      return usd;
    } catch (error) {
      return "Error";
    }
  }

  Future<double> getGoldRate() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.goldapi.io/api/XAU/USD'), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "x-access-token": "goldapi-4goeustkvyvclwr-io"
      });

      var rs = jsonDecode(response.body);
      var usd = rs['price'];

      return usd;
    } catch (error) {
      return 0.0;
    }
  }

  Future<double> getSilverRate() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.goldapi.io/api/XAG/USD'), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "x-access-token": "goldapi-4goeustkvyvclwr-io"
      });

      var rs = jsonDecode(response.body);
      var usd = rs['price'];

      return usd;
    } catch (error) {
      return 0.0;
    }
  }
}
