import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_app/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:loader_overlay/loader_overlay.dart';


class ImagePickerProvider with ChangeNotifier {
  late File _selectedImage;
  DateTime? _updatedTime;

  File get selectedImage => _selectedImage;

  DateTime? get updatedTime => _updatedTime;

  Future<void> pickImage(
    ImageSource source, {
    VoidCallback? onSelected,
  }) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final croppedImage = await _cropImage(File(pickedFile.path));
        if (croppedImage != null) {
          _selectedImage = File(croppedImage.path);
          _updatedTime = DateTime.now();
          notifyListeners();
          if (onSelected != null) {
            onSelected();
          }
        }
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  Future<CroppedFile?> _cropImage(File imageFile) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Edit Photo',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Edit Photo',
          ),
        ],
      );
      return croppedFile;
    } catch (e) {
      debugPrint('Error cropping image: $e');
      return null;
    }
  }

  Future<void> saveImageToCache(GlobalKey key) async {
    try {
      navigatorKey.currentContext?.loaderOverlay.show();
      // Capture the image as a byte data
      RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0); // Adjust the pixel ratio as needed
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List uint8List = byteData!.buffer.asUint8List();

      // Get the cache directory
      Directory cacheDirectory = await getTemporaryDirectory();

      // Define a unique filename (e.g., timestamp.png)
      String fileName = "${DateTime.now().millisecondsSinceEpoch}.png";

      // Create a File instance and write the image data to it
      File imageFile = File('${cacheDirectory.path}/$fileName');
      await imageFile.writeAsBytes(uint8List);

      // Provide feedback or further processing as needed
      debugPrint("Image saved to cache: ${imageFile.path}");
      _selectedImage = imageFile;
      notifyListeners();
    } catch (e) {
      debugPrint("Error saving image: $e");
    }
  }
}
