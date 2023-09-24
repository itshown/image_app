// To parse this JSON data, do
//
//     final bannerImageResponse = bannerImageResponseFromJson(jsonString);

import 'dart:convert';

BannerImageResponse bannerImageResponseFromJson(String str) => BannerImageResponse.fromJson(json.decode(str));

String bannerImageResponseToJson(BannerImageResponse data) => json.encode(data.toJson());

class BannerImageResponse {
  bool success;
  bool isAuth;
  String message;
  List<Result> result;

  BannerImageResponse({
    required this.success,
    required this.isAuth,
    required this.message,
    required this.result,
  });

  factory BannerImageResponse.fromJson(Map<String, dynamic> json) => BannerImageResponse(
    success: json["success"],
    isAuth: json["isAuth"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "isAuth": isAuth,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  String uid;
  String profileBannerImageUrl;

  Result({
    required this.uid,
    required this.profileBannerImageUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    uid: json["uid"],
    profileBannerImageUrl: json["profileBannerImageURL"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "profileBannerImageURL": profileBannerImageUrl,
  };
}
