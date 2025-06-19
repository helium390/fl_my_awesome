// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());

class Photo {
  String? urlString;
  bool? result;
  int? state;

  Photo({
    this.urlString,
    this.result,
    this.state,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        urlString: json["urlString"],
        result: json["result"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "urlString": urlString,
        "result": result,
        "state": state,
      };
}
