import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_app/config/constants.dart';
import 'package:image_app/utils/string_ext.dart';
import 'package:image_app/view_models/card_preview_provider.dart';
import 'package:image_app/view_models/image_picker_provider.dart';
import 'package:image_app/view_models/image_state_provider.dart';
import 'package:image_app/view_models/image_upload_provider.dart';
import 'package:image_app/views/card_preview_screen.dart';
import 'package:image_app/views/custom_card_screen.dart';
import 'package:image_app/views/customize_card_screen.dart';
import 'package:image_app/views/photo_select_screen.dart';
import 'package:image_app/views/upload_photo_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'config/routes.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageStateProvider()),
        ChangeNotifierProvider(create: (context) => ImagePickerProvider()),
        ChangeNotifierProvider(create: (context) => ImageUploadProvider()),
        ChangeNotifierProvider(create: (context) => CardPreviewProvider()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: SpinKitCubeGrid(
            color: hexPrimaryColor.hexToColor,
            size: 50.0,
          ),
        ),
        overlayColor: Colors.black,
        overlayOpacity: 0.8,
        duration: const Duration(seconds: 2),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: _onGenerateRoute,
          initialRoute: '/',
        ),
      ),
    ),
  );
}

Route<dynamic>? _onGenerateRoute(RouteSettings? settings) {
  switch (settings?.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const PhotoSelectScreen(),
      );
    case Routes.uploadPic:
      return MaterialPageRoute(
        builder: (context) => UploadPhotoScreen(),
      );
    case Routes.cardPreview:
      return MaterialPageRoute(
        builder: (context) => const CardPreviewScreen(),
      );
    case Routes.customize:
      return MaterialPageRoute(
        builder: (context) => const CustomCardScreen(),
      );
    case Routes.imgPanning:
      return MaterialPageRoute(
        builder: (context) => const CustomizeCardScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const PhotoSelectScreen(),
      );
  }
}
