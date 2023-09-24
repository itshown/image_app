import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:image_app/utils/string_ext.dart';
import 'package:image_app/view_models/image_picker_provider.dart';
import 'package:image_picker/image_picker.dart';

import '../config/app_images.dart';
import '../config/constants.dart';
import 'custom_spacer.dart';

Widget bottomSheetUi(
  BuildContext ctx,
  ImagePickerProvider pickerProvider, {
  VoidCallback? onSelected,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 140,
        padding: const EdgeInsets.only(top: 30.0),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: _sheetIconButton(
                ctx,
                pickerProvider,
                onSelected: onSelected,
              ),
            ),
            Flexible(
              child: _sheetIconButton(
                ctx,
                pickerProvider,
                isCamera: false,
                onSelected: onSelected,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _sheetIconButton(
  BuildContext ctx,
  ImagePickerProvider pickerProvider, {
  bool isCamera = true,
  VoidCallback? onSelected,
}) =>
    InkWell(
      onTap: () {
        ctx.pop();
        pickerProvider.pickImage(
          isCamera ? ImageSource.camera : ImageSource.gallery,
          onSelected: onSelected,
        );
      },
      child: Column(
        children: [
          _addCircularBorder(
            child: _icon(
              isCamera ? AppImages.camera : AppImages.gallery,
              width: 26.0,
              height: 26.0,
            ),
          ),
          CustomSpacer.verticalSpacer(5),
          _text(
            isCamera ? "Camera" : "Gallery",
            14.0,
            color: Colors.black,
            weight: FontWeight.w500,
          )
        ],
      ),
    );

Widget _addCircularBorder({required Widget child}) => Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black12,
          width: 2.0, // Adjust the border width as needed
        ),
      ),
      child: CircleAvatar(backgroundColor: Colors.transparent, child: child),
    );

Widget _icon(String asset, {double? width, double? height}) => SvgPicture.asset(
      asset,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );

Widget _text(String txt, double fontSize, {Color? color, FontWeight? weight}) =>
    Text(
      txt,
      style: TextStyle(
        color: color ?? hexPrimaryColor.hexToColor,
        fontSize: fontSize,
        fontWeight: weight ?? FontWeight.bold,
      ),
    );
