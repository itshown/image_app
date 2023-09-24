// To parse this JSON data, do
//
//     final cardDesignResponse = cardDesignResponseFromJson(jsonString);

import 'dart:convert';

CardDesignResponse cardDesignResponseFromJson(String str) => CardDesignResponse.fromJson(json.decode(str));

String cardDesignResponseToJson(CardDesignResponse data) => json.encode(data.toJson());

class CardDesignResponse {
  bool success;
  bool isAuth;
  String message;
  List<Result> result;

  CardDesignResponse({
    required this.success,
    required this.isAuth,
    required this.message,
    required this.result,
  });

  factory CardDesignResponse.fromJson(Map<String, dynamic> json) => CardDesignResponse(
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
  List<CardDesignVariation> cardDesignVariations;
  String cardImageId;
  String cardShortBgUrl;
  String cardLongBgUrl;
  String cardImageUrl;
  String cardImageUrl2;
  String cardImageUrl3;
  String cardImageUrl4;
  String categoryId;
  String cardName;
  String errorTextColor;
  String cardDesignType;
  ResultCustomImageCardDesignInfo customImageCardDesignInfo;
  ProfileDesignInfo profileDesignInfo;
  DpStyling dpStyling;
  Styling userNameStyling;
  Styling titleStyling;
  Styling locationStyling;
  CompanyStyling companyStyling;
  SStyling skillsStyling;
  SStyling hobbiesStyling;
  SStyling subjectsStyling;
  Styling phoneStyling;
  Styling emailStyling;
  Styling addressStyling;
  ActionIcons actionIcons;
  bool favouriteStatus;

  Result({
    required this.cardDesignVariations,
    required this.cardImageId,
    required this.cardShortBgUrl,
    required this.cardLongBgUrl,
    required this.cardImageUrl,
    required this.cardImageUrl2,
    required this.cardImageUrl3,
    required this.cardImageUrl4,
    required this.categoryId,
    required this.cardName,
    required this.errorTextColor,
    required this.cardDesignType,
    required this.customImageCardDesignInfo,
    required this.profileDesignInfo,
    required this.dpStyling,
    required this.userNameStyling,
    required this.titleStyling,
    required this.locationStyling,
    required this.companyStyling,
    required this.skillsStyling,
    required this.hobbiesStyling,
    required this.subjectsStyling,
    required this.phoneStyling,
    required this.emailStyling,
    required this.addressStyling,
    required this.actionIcons,
    required this.favouriteStatus,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    cardDesignVariations: List<CardDesignVariation>.from(json["cardDesignVariations"].map((x) => CardDesignVariation.fromJson(x))),
    cardImageId: json["cardImageId"],
    cardShortBgUrl: json["cardShortBgURL"],
    cardLongBgUrl: json["cardLongBgURL"],
    cardImageUrl: json["cardImageURL"],
    cardImageUrl2: json["cardImageURL2"],
    cardImageUrl3: json["cardImageURL3"],
    cardImageUrl4: json["cardImageURL4"],
    categoryId: json["categoryId"],
    cardName: json["cardName"],
    errorTextColor: json["errorTextColor"],
    cardDesignType: json["cardDesignType"],
    customImageCardDesignInfo: ResultCustomImageCardDesignInfo.fromJson(json["customImageCardDesignInfo"]),
    profileDesignInfo: ProfileDesignInfo.fromJson(json["profileDesignInfo"]),
    dpStyling: DpStyling.fromJson(json["dpStyling"]),
    userNameStyling: Styling.fromJson(json["userNameStyling"]),
    titleStyling: Styling.fromJson(json["titleStyling"]),
    locationStyling: Styling.fromJson(json["locationStyling"]),
    companyStyling: CompanyStyling.fromJson(json["companyStyling"]),
    skillsStyling: SStyling.fromJson(json["skillsStyling"]),
    hobbiesStyling: SStyling.fromJson(json["hobbiesStyling"]),
    subjectsStyling: SStyling.fromJson(json["subjectsStyling"]),
    phoneStyling: Styling.fromJson(json["phoneStyling"]),
    emailStyling: Styling.fromJson(json["emailStyling"]),
    addressStyling: Styling.fromJson(json["addressStyling"]),
    actionIcons: ActionIcons.fromJson(json["actionIcons"]),
    favouriteStatus: json["favouriteStatus"],
  );

  Map<String, dynamic> toJson() => {
    "cardDesignVariations": List<dynamic>.from(cardDesignVariations.map((x) => x.toJson())),
    "cardImageId": cardImageId,
    "cardShortBgURL": cardShortBgUrl,
    "cardLongBgURL": cardLongBgUrl,
    "cardImageURL": cardImageUrl,
    "cardImageURL2": cardImageUrl2,
    "cardImageURL3": cardImageUrl3,
    "cardImageURL4": cardImageUrl4,
    "categoryId": categoryId,
    "cardName": cardName,
    "errorTextColor": errorTextColor,
    "cardDesignType": cardDesignType,
    "customImageCardDesignInfo": customImageCardDesignInfo.toJson(),
    "profileDesignInfo": profileDesignInfo.toJson(),
    "dpStyling": dpStyling.toJson(),
    "userNameStyling": userNameStyling.toJson(),
    "titleStyling": titleStyling.toJson(),
    "locationStyling": locationStyling.toJson(),
    "companyStyling": companyStyling.toJson(),
    "skillsStyling": skillsStyling.toJson(),
    "hobbiesStyling": hobbiesStyling.toJson(),
    "subjectsStyling": subjectsStyling.toJson(),
    "phoneStyling": phoneStyling.toJson(),
    "emailStyling": emailStyling.toJson(),
    "addressStyling": addressStyling.toJson(),
    "actionIcons": actionIcons.toJson(),
    "favouriteStatus": favouriteStatus,
  };
}

class ActionIcons {
  String type;
  String backgroundColor;
  Color iconColor;
  Alignment alignment;

  ActionIcons({
    required this.type,
    required this.backgroundColor,
    required this.iconColor,
    required this.alignment,
  });

  factory ActionIcons.fromJson(Map<String, dynamic> json) => ActionIcons(
    type: json["type"],
    backgroundColor: json["backgroundColor"],
    iconColor: colorValues.map[json["iconColor"]]!,
    alignment: alignmentValues.map[json["alignment"]]!,
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "backgroundColor": backgroundColor,
    "iconColor": colorValues.reverse[iconColor],
    "alignment": alignmentValues.reverse[alignment],
  };
}

enum Alignment {
  CENTER,
  LEFT
}

final alignmentValues = EnumValues({
  "center": Alignment.CENTER,
  "left": Alignment.LEFT
});

enum Color {
  FFFFFF
}

final colorValues = EnumValues({
  "FFFFFF": Color.FFFFFF
});

class Styling {
  String fontSize;
  Alignment alignment;
  Color fontColor;
  FontStyle fontStyle;
  FontStyle fontWeight;
  String? noOfLines;

  Styling({
    required this.fontSize,
    required this.alignment,
    required this.fontColor,
    required this.fontStyle,
    required this.fontWeight,
    this.noOfLines,
  });

  factory Styling.fromJson(Map<String, dynamic> json) => Styling(
    fontSize: json["fontSize"],
    alignment: alignmentValues.map[json["alignment"]]!,
    fontColor: colorValues.map[json["fontColor"]]!,
    fontStyle: fontStyleValues.map[json["fontStyle"]]!,
    fontWeight: fontStyleValues.map[json["fontWeight"]]!,
    noOfLines: json["noOfLines"],
  );

  Map<String, dynamic> toJson() => {
    "fontSize": fontSize,
    "alignment": alignmentValues.reverse[alignment],
    "fontColor": colorValues.reverse[fontColor],
    "fontStyle": fontStyleValues.reverse[fontStyle],
    "fontWeight": fontStyleValues.reverse[fontWeight],
    "noOfLines": noOfLines,
  };
}

enum FontStyle {
  BOLD,
  NORMAL,
  SEMI_BOLD
}

final fontStyleValues = EnumValues({
  "bold": FontStyle.BOLD,
  "normal": FontStyle.NORMAL,
  "semi-bold": FontStyle.SEMI_BOLD
});

class CardDesignVariation {
  Styling userNameStyling;
  Styling titleStyling;
  Styling locationStyling;
  ActionIcons actionIcons;
  ProfileDesignInfo profileDesignInfo;
  String cardLongBgUrl;
  String cardDesignType;
  CardDesignVariationCustomImageCardDesignInfo customImageCardDesignInfo;
  String cardImageUrl4;
  String cardImageId;
  String cardImageUrl;

  CardDesignVariation({
    required this.userNameStyling,
    required this.titleStyling,
    required this.locationStyling,
    required this.actionIcons,
    required this.profileDesignInfo,
    required this.cardLongBgUrl,
    required this.cardDesignType,
    required this.customImageCardDesignInfo,
    required this.cardImageUrl4,
    required this.cardImageId,
    required this.cardImageUrl,
  });

  factory CardDesignVariation.fromJson(Map<String, dynamic> json) => CardDesignVariation(
    userNameStyling: Styling.fromJson(json["userNameStyling"]),
    titleStyling: Styling.fromJson(json["titleStyling"]),
    locationStyling: Styling.fromJson(json["locationStyling"]),
    actionIcons: ActionIcons.fromJson(json["actionIcons"]),
    profileDesignInfo: ProfileDesignInfo.fromJson(json["profileDesignInfo"]),
    cardLongBgUrl: json["cardLongBgURL"],
    cardDesignType: json["cardDesignType"],
    customImageCardDesignInfo: CardDesignVariationCustomImageCardDesignInfo.fromJson(json["customImageCardDesignInfo"]),
    cardImageUrl4: json["cardImageURL4"],
    cardImageId: json["cardImageId"],
    cardImageUrl: json["cardImageURL"],
  );

  Map<String, dynamic> toJson() => {
    "userNameStyling": userNameStyling.toJson(),
    "titleStyling": titleStyling.toJson(),
    "locationStyling": locationStyling.toJson(),
    "actionIcons": actionIcons.toJson(),
    "profileDesignInfo": profileDesignInfo.toJson(),
    "cardLongBgURL": cardLongBgUrl,
    "cardDesignType": cardDesignType,
    "customImageCardDesignInfo": customImageCardDesignInfo.toJson(),
    "cardImageURL4": cardImageUrl4,
    "cardImageId": cardImageId,
    "cardImageURL": cardImageUrl,
  };
}

class CardDesignVariationCustomImageCardDesignInfo {
  String primaryColor;
  String profileBannerImageUrl;

  CardDesignVariationCustomImageCardDesignInfo({
    required this.primaryColor,
    required this.profileBannerImageUrl,
  });

  factory CardDesignVariationCustomImageCardDesignInfo.fromJson(Map<String, dynamic> json) => CardDesignVariationCustomImageCardDesignInfo(
    primaryColor: json["primaryColor"],
    profileBannerImageUrl: json["profileBannerImageURL"],
  );

  Map<String, dynamic> toJson() => {
    "primaryColor": primaryColor,
    "profileBannerImageURL": profileBannerImageUrl,
  };
}

class ProfileDesignInfo {
  Opacity opacity;
  String designType;
  String? errorTextColor;
  String primaryColor;
  String secondaryColor;
  String textColor;
  String profileBannerImageUrl;
  String baseColor;
  bool tint;

  ProfileDesignInfo({
    required this.opacity,
    required this.designType,
    this.errorTextColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.textColor,
    required this.profileBannerImageUrl,
    required this.baseColor,
    required this.tint,
  });

  factory ProfileDesignInfo.fromJson(Map<String, dynamic> json) => ProfileDesignInfo(
    opacity: Opacity.fromJson(json["opacity"]),
    designType: json["designType"],
    errorTextColor: json["errorTextColor"],
    primaryColor: json["primaryColor"],
    secondaryColor: json["secondaryColor"],
    textColor: json["textColor"],
    profileBannerImageUrl: json["profileBannerImageURL"],
    baseColor: json["baseColor"],
    tint: json["tint"],
  );

  Map<String, dynamic> toJson() => {
    "opacity": opacity.toJson(),
    "designType": designType,
    "errorTextColor": errorTextColor,
    "primaryColor": primaryColor,
    "secondaryColor": secondaryColor,
    "textColor": textColor,
    "profileBannerImageURL": profileBannerImageUrl,
    "baseColor": baseColor,
    "tint": tint,
  };
}

class Opacity {
  String primary;
  String secondary;

  Opacity({
    required this.primary,
    required this.secondary,
  });

  factory Opacity.fromJson(Map<String, dynamic> json) => Opacity(
    primary: json["primary"],
    secondary: json["secondary"],
  );

  Map<String, dynamic> toJson() => {
    "primary": primary,
    "secondary": secondary,
  };
}

class CompanyStyling {
  String fontSize;
  Alignment alignment;
  Color fontColor;
  FontStyle fontStyle;
  FontStyle fontWeight;
  String companyDesignationFontSize;
  Color companyDesignationFontColor;
  FontStyle companyDesignationFontStyle;
  FontStyle companyDesignationFontWeight;

  CompanyStyling({
    required this.fontSize,
    required this.alignment,
    required this.fontColor,
    required this.fontStyle,
    required this.fontWeight,
    required this.companyDesignationFontSize,
    required this.companyDesignationFontColor,
    required this.companyDesignationFontStyle,
    required this.companyDesignationFontWeight,
  });

  factory CompanyStyling.fromJson(Map<String, dynamic> json) => CompanyStyling(
    fontSize: json["fontSize"],
    alignment: alignmentValues.map[json["alignment"]]!,
    fontColor: colorValues.map[json["fontColor"]]!,
    fontStyle: fontStyleValues.map[json["fontStyle"]]!,
    fontWeight: fontStyleValues.map[json["fontWeight"]]!,
    companyDesignationFontSize: json["companyDesignationFontSize"],
    companyDesignationFontColor: colorValues.map[json["companyDesignationFontColor"]]!,
    companyDesignationFontStyle: fontStyleValues.map[json["companyDesignationFontStyle"]]!,
    companyDesignationFontWeight: fontStyleValues.map[json["companyDesignationFontWeight"]]!,
  );

  Map<String, dynamic> toJson() => {
    "fontSize": fontSize,
    "alignment": alignmentValues.reverse[alignment],
    "fontColor": colorValues.reverse[fontColor],
    "fontStyle": fontStyleValues.reverse[fontStyle],
    "fontWeight": fontStyleValues.reverse[fontWeight],
    "companyDesignationFontSize": companyDesignationFontSize,
    "companyDesignationFontColor": colorValues.reverse[companyDesignationFontColor],
    "companyDesignationFontStyle": fontStyleValues.reverse[companyDesignationFontStyle],
    "companyDesignationFontWeight": fontStyleValues.reverse[companyDesignationFontWeight],
  };
}

class ResultCustomImageCardDesignInfo {
  String primaryColor;
  String profileBannerImageUrl;
  List<dynamic> colorFilter;

  ResultCustomImageCardDesignInfo({
    required this.primaryColor,
    required this.profileBannerImageUrl,
    required this.colorFilter,
  });

  factory ResultCustomImageCardDesignInfo.fromJson(Map<String, dynamic> json) => ResultCustomImageCardDesignInfo(
    primaryColor: json["primaryColor"],
    profileBannerImageUrl: json["profileBannerImageURL"],
    colorFilter: List<dynamic>.from(json["colorFilter"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "primaryColor": primaryColor,
    "profileBannerImageURL": profileBannerImageUrl,
    "colorFilter": List<dynamic>.from(colorFilter.map((x) => x)),
  };
}

class DpStyling {
  String borderPresent;
  BorderDetails borderDetails;
  Alignment alignment;

  DpStyling({
    required this.borderPresent,
    required this.borderDetails,
    required this.alignment,
  });

  factory DpStyling.fromJson(Map<String, dynamic> json) => DpStyling(
    borderPresent: json["borderPresent"],
    borderDetails: BorderDetails.fromJson(json["borderDetails"]),
    alignment: alignmentValues.map[json["alignment"]]!,
  );

  Map<String, dynamic> toJson() => {
    "borderPresent": borderPresent,
    "borderDetails": borderDetails.toJson(),
    "alignment": alignmentValues.reverse[alignment],
  };
}

class BorderDetails {
  String type;
  Color color;
  String thickness;

  BorderDetails({
    required this.type,
    required this.color,
    required this.thickness,
  });

  factory BorderDetails.fromJson(Map<String, dynamic> json) => BorderDetails(
    type: json["type"],
    color: colorValues.map[json["color"]]!,
    thickness: json["thickness"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "color": colorValues.reverse[color],
    "thickness": thickness,
  };
}

class SStyling {
  String boxBackgroundColor;
  String fontColor;
  String fontSize;

  SStyling({
    required this.boxBackgroundColor,
    required this.fontColor,
    required this.fontSize,
  });

  factory SStyling.fromJson(Map<String, dynamic> json) => SStyling(
    boxBackgroundColor: json["boxBackgroundColor"],
    fontColor: json["fontColor"],
    fontSize: json["fontSize"],
  );

  Map<String, dynamic> toJson() => {
    "boxBackgroundColor": boxBackgroundColor,
    "fontColor": fontColor,
    "fontSize": fontSize,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
