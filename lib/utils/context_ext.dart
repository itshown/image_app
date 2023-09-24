import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  // mediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  double get statusBarHeight => mediaQuery.padding.top;

  double get navigationBarHeight => kToolbarHeight;

  void showToast(String message, {int duration = 2}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: duration),
      ),
    );
  }

  Future<void> showAlert({
    String title = 'Alert',
    String content = '',
    String confirmText = 'OK',
  }) async {
    return showCupertinoDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: pop,
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }

  void showBottomSheet({
    required Widget Function(BuildContext context) builder,
    bool isScrollControlled = false,
  }) {
    showModalBottomSheet(
      context: this,
      builder: builder,
      isScrollControlled: isScrollControlled,
    );
  }


  /// -----------------------------------------


  // navigation
  void pushNamed(String routeName) => Navigator.of(this).pushNamed(routeName);

  void pushReplacementNamed(String routeName) =>
      Navigator.of(this).pushReplacementNamed(routeName);

  void pushNamedAndRemoveUntil(String newRouteName, String untilRouteName) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
          newRouteName, ModalRoute.withName(untilRouteName));

  void pop() => Navigator.of(this).pop();

  void popUntil(String routeName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));


  // has internet access
  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // internet is available
      }
    } on SocketException catch (_) {
      return false; // no internet connection
    }
    return false; // default to no internet connection
  }
}
