import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_app/config/api_constants.dart';
import 'package:image_app/config/routes.dart';
import 'package:image_app/main.dart';
import 'package:image_app/models/card_design_response.dart';
import 'package:image_app/models/card_image_request.dart';
import 'package:image_app/services/api_service.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../models/banner_image_response.dart';
import 'image_picker_provider.dart';

class CardPreviewProvider with ChangeNotifier {
  String? bannerImage;

  Future<void> getImage() async {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) return;
    try {
      if (await context.isConnected()) {
        CardImageRequest request = CardImageRequest(cardImageId: "6300ba8b5c4ce60057ef9b0c");
        var res = await ApiService().post(APIConstants.selectedCardDesign, request.toJson());
        if (res.status) {
          CardDesignResponse response = CardDesignResponse.fromJson(res.data);
          await Future.delayed(const Duration(seconds: 2));
          if (context.mounted && response.success) {
            context.loaderOverlay.hide();
            bannerImage = response.result.first.customImageCardDesignInfo.profileBannerImageUrl;
            notifyListeners();
          }
        }
      }
    } catch (e) {
      debugPrint('Error uploading image: $e');
      context.loaderOverlay.hide();
    }
  }
}
