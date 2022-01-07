import 'dart:convert';

Metal imgFromJson(String str) => Metal.fromJson(json.decode(str));
String imgToJson(Metal data) => json.encode(data.toJson());

class Metal {
  final double? timestamp;
  final double? metal;
  final double? price;

  Metal({this.timestamp, this.metal, this.price});

  factory Metal.fromJson(Map<String, dynamic> json) => Metal(
      timestamp: json["timestamp"], metal: json["metal"], price: json["price"]);

  Map<String, dynamic> toJson() =>
      {"timestamp": timestamp, "metal": metal, "price": price};
}
