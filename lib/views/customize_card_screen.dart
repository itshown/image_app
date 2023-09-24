import 'package:flutter/material.dart';
import 'package:image_app/config/app_images.dart';
import 'package:image_app/config/constants.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:image_app/utils/string_ext.dart';
import 'package:image_app/view_models/card_preview_provider.dart';
import 'package:image_app/widgets/custom_spacer.dart';
import 'package:image_app/widgets/interactive_image.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../view_models/image_picker_provider.dart';
import '../view_models/image_state_provider.dart';

import '../view_models/image_upload_provider.dart';
import '../widgets/img_select_bottom_sheet.dart';

class CustomizeCardScreen extends StatefulWidget {
  const CustomizeCardScreen({super.key});

  @override
  State<CustomizeCardScreen> createState() => _CustomizeCardScreenState();
}

class _CustomizeCardScreenState extends State<CustomizeCardScreen> {
  late ImageStateProvider _imageStateProvider;
  late ImagePickerProvider _imagePickerProvider;
  late ImageUploadProvider _imageUploadProvider;
  late CardPreviewProvider _previewProvider;

  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _imageStateProvider = Provider.of<ImageStateProvider>(context);
    _imagePickerProvider = Provider.of<ImagePickerProvider>(context);
    _imageUploadProvider = Provider.of<ImageUploadProvider>(context);
    _previewProvider = Provider.of<CardPreviewProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                CustomSpacer.horizontalSpacer(18),
                const Expanded(
                  child: Text(
                    "Customize Your Card",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _imageStateProvider.resetChanges();
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
                CustomSpacer.horizontalSpacer(5),
              ],
            ),
            Flexible(child: _bodyWidget()),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Consumer<CardPreviewProvider>(
      builder: (ctx, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSpacer.verticalSpacer(3),
            _changeImageCard(),
            Container(
              width: context.screenWidth,
              height: context.screenHeight / 1.5,
              margin: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  RepaintBoundary(
                    key: _repaintBoundaryKey,
                    child: InteractiveImage(
                      image: _imagePickerProvider.updatedTime != null
                          ? Image.file(
                              _imagePickerProvider.selectedImage,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              provider.bannerImage!,
                              fit: BoxFit.cover,
                            ),
                      imgStateProvider: _imageStateProvider,
                    ),
                  ),
                  _topWidgets(),
                ],
              ),
            ),

            // edit card
            _saveCard(),
          ],
        );
      },
    );
  }

  Widget _topWidgets() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSpacer.verticalSpacer(30),
          // avatar
          ClipOval(
            child: Image.asset(
              AppImages.ironMan,
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          CustomSpacer.verticalSpacer(3),
          const Text(
            "Iron Man",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomSpacer.verticalSpacer(3),
          const Text(
            "New York",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomSpacer.verticalSpacer(8),
          const Text(
            "Superhero | Industrialist | Philanthropist",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );

  Widget _changeImageCard() => InkWell(
        onTap: () {
          context.showBottomSheet(
            builder: (ctx) => bottomSheetUi(ctx, _imagePickerProvider),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400.withOpacity(0.5)),
            color: Colors.grey.shade100,
          ),
          child: const ListTile(
            leading: Icon(
              Icons.photo_size_select_actual_outlined,
              color: Colors.blue,
            ),
            title: Text(
              "Change picture here and adjust",
            ),
          ),
        ),
      );

  Widget _saveCard() => Container(
        width: context.screenWidth,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: TextButton(
          onPressed: () {
            _imagePickerProvider.saveImageToCache(_repaintBoundaryKey).then((_) {
              _imageUploadProvider.postImage(
                  onUploaded: () {
                    _previewProvider.getImage();
                    context.loaderOverlay.hide();
                    context.pop();
                  }
              );
              context.loaderOverlay.hide();
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(hexRedColor.hexToColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
}
