// To parse this JSON data, do
//
//     final cardImageRequest = cardImageRequestFromJson(jsonString);

import 'dart:convert';

CardImageRequest cardImageRequestFromJson(String str) => CardImageRequest.fromJson(json.decode(str));

String cardImageRequestToJson(CardImageRequest data) => json.encode(data.toJson());

class CardImageRequest {
  String cardImageId;

  CardImageRequest({
    required this.cardImageId,
  });

  factory CardImageRequest.fromJson(Map<String, dynamic> json) => CardImageRequest(
    cardImageId: json["cardImageId"],
  );

  Map<String, dynamic> toJson() => {
    "cardImageId": cardImageId,
  };
}
