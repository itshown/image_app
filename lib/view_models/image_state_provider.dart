import 'package:flutter/material.dart';

class ImageStateProvider with ChangeNotifier {
  double zoom = 1.0;
  Offset position = const Offset(0.0, 0.0);
  Image? image;

  void updateZoom(double newZoom) {
    zoom = newZoom;
    notifyListeners();
  }

  void updatePosition(Offset newPosition) {
    position = newPosition;
    notifyListeners();
  }

  void saveChanges() {
    notifyListeners();
  }

  void resetChanges() {
    zoom = 1.0;
    position = const Offset(0.0, 0.0);
    notifyListeners();
  }

  void updateImage(Image newImage) {
    image = newImage;
    notifyListeners();
  }
}