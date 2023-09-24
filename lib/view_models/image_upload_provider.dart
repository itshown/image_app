import 'package:flutter/material.dart';
import 'package:image_app/config/api_constants.dart';
import 'package:image_app/main.dart';
import 'package:image_app/services/api_service.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../models/banner_image_response.dart';
import 'image_picker_provider.dart';

class ImageUploadProvider with ChangeNotifier {
  Future<void> postImage({VoidCallback? onUploaded}) async {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) return;
    context.loaderOverlay.show();
    ImagePickerProvider imgProvider =
        Provider.of<ImagePickerProvider>(context, listen: false);
    try {
      if (await context.isConnected()) {
        debugPrint("selectedImage => ${imgProvider.selectedImage}");
        var res = await ApiService().upload(APIConstants.postProfileBanner,
            image: imgProvider.selectedImage, key: "profileBannerImageURL");
        if (res.status) {
          BannerImageResponse response = BannerImageResponse.fromJson(res.data);
          await Future.delayed(const Duration(seconds: 2));
          if (context.mounted && response.success) {
            context.loaderOverlay.hide();
            context.showToast(response.message);
            if (onUploaded != null) onUploaded();
            context.loaderOverlay.show();
          }
        }
      }
    } catch (e) {
      debugPrint('Error uploading image: $e');
      context.loaderOverlay.hide();
    }
  }
}
