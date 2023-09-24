import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_app/config/app_images.dart';
import 'package:image_app/config/constants.dart';
import 'package:image_app/utils/string_ext.dart';
import 'package:image_app/widgets/custom_app_bar.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:image_app/widgets/custom_spacer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../config/routes.dart';
import '../main.dart';
import '../view_models/image_picker_provider.dart';
import '../widgets/img_select_bottom_sheet.dart';

class PhotoSelectScreen extends StatefulWidget {
  final bool fromInside;
  const PhotoSelectScreen({super.key, this.fromInside = false});

  @override
  State<PhotoSelectScreen> createState() => _PhotoSelectScreenState();
}

class _PhotoSelectScreenState extends State<PhotoSelectScreen> {
  late ImagePickerProvider _imagePickerProvider;

  @override
  Widget build(BuildContext context) {
    _imagePickerProvider = Provider.of<ImagePickerProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Change design",
        hideBackBtn: !widget.fromInside,
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return InkWell(
      onTap: () {
        context.showBottomSheet(
          builder: (ctx) => bottomSheetUi(ctx, _imagePickerProvider, onSelected: () {
            navigatorKey.currentContext?.pushNamed(Routes.uploadPic);
          }),
        );
      },
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: context.screenWidth,
                margin: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: hexContainerBgColor.hexToColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _icon(AppImages.magicStarTop),
                    CustomSpacer.horizontalSpacer(15.0),
                    _text("Upload picture", 20.0),
                    CustomSpacer.horizontalSpacer(15.0),
                    _icon(AppImages.magicStarBottom),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _icon(String asset, {double? width, double? height}) =>
      SvgPicture.asset(
        asset,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );

  Widget _text(String txt, double fontSize,
          {Color? color, FontWeight? weight}) =>
      Text(
        txt,
        style: TextStyle(
          color: color ?? hexPrimaryColor.hexToColor,
          fontSize: fontSize,
          fontWeight: weight ?? FontWeight.bold,
        ),
      );

}
