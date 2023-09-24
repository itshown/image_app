import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_app/main.dart';
import 'package:image_app/utils/context_ext.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String title,
    List<Widget>? actions,
    Color? backgroundColor = Colors.white,
    double elevation = 0.0,
    Color titleColor = Colors.black,
    Color iconColor = Colors.black,
    double titleFontSize = 20.0,
    bool disableBackPress = false,
    bool hideBackBtn = false,
    Color statusBarColor = Colors.white,
    VoidCallback? onBackPressed,
  }) : super(
          centerTitle: false,
          backgroundColor: backgroundColor,
          elevation: elevation,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: statusBarColor,
            statusBarBrightness: Brightness.light,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              color: titleColor,
            ),
          ),
          leading: hideBackBtn ? null : IconButton(
            onPressed: disableBackPress
                ? null
                : onBackPressed ?? () => navigatorKey.currentContext?.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24,
              color: iconColor,
            ),
          ),
          actions: actions,
        );
}
