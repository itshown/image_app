import 'package:flutter/material.dart';
import 'package:image_app/config/constants.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:image_app/utils/string_ext.dart';
import 'package:image_app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../config/routes.dart';
import '../view_models/card_preview_provider.dart';
import '../view_models/image_picker_provider.dart';
import '../view_models/image_upload_provider.dart';
import '../widgets/custom_spacer.dart';

class UploadPhotoScreen extends StatelessWidget {
  UploadPhotoScreen({super.key});

  late ImagePickerProvider _imagePickerProvider;
  late ImageUploadProvider _imageUploadProvider;
  late CardPreviewProvider _previewProvider;

  @override
  Widget build(BuildContext context) {
    _imagePickerProvider = Provider.of<ImagePickerProvider>(context);
    _imageUploadProvider = Provider.of<ImageUploadProvider>(context);
    _previewProvider = Provider.of<CardPreviewProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Upload picture",
      ),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext ctx) {
    return Container(
      height: ctx.screenHeight,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              CustomSpacer.verticalSpacer(18),
              _imageCard(ctx),
              CustomSpacer.verticalSpacer(8),
              _infoText(),
              CustomSpacer.verticalSpacer(20),
            ],
          ),

          // save button
          _saveButton(ctx),
        ],
      ),
    );
  }

  Widget _imageCard(BuildContext ctx) {
    return Container(
      width: ctx.screenWidth,
      height: ctx.screenHeight / 1.8,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.file(
          _imagePickerProvider.selectedImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _infoText() => const Text(
    "Picture ready to be saved",
    style: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
  );

  Widget _saveButton(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 10,
      child: InkWell(
        onTap: () {
          // upload image
          _imageUploadProvider.postImage(
            onUploaded: () {
              _previewProvider.getImage();
              context.pushNamed(Routes.cardPreview);
            }
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30.0),
            color: hexRedColor.hexToColor,
          ),
          child: const Text(
            "Save & Continue",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

}
