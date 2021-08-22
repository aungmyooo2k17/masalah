import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class ApiClient {
  static const String _baseUrl = "aungmyooo2k17.github.io";
  final Client _client;
  ApiClient(this._client);

  Future<Response> request(
      {@required RequestType? requestType,
      @required String? path,
      dynamic parameter = Nothing}) async {
    switch (requestType) {
      case RequestType.GET:
        return _client.get(Uri.http(_baseUrl, "/$path"), headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });

      case RequestType.POST:
        return _client.post(Uri.http(_baseUrl, "/$path"),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json"
            },
            body: json.encode(parameter));

      case RequestType.DELETE:
        return _client.delete(Uri.http(_baseUrl, "/$path"));

      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request method is not found");
    }
  }
}

enum RequestType { GET, POST, DELETE }

class Nothing {
  Nothing._();
}

class RequestTypeNotFoundException implements Exception {
  String cause;
  RequestTypeNotFoundException(this.cause);
}
