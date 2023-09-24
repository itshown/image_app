import 'package:flutter/material.dart';

class CustomSpacer {
  static Widget horizontalSpacer(double size) => SizedBox(
    width: size,
  );

  static Widget verticalSpacer(double size) => SizedBox(
    height: size,
  );
}