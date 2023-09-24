import 'package:flutter/material.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:provider/provider.dart';

import '../view_models/image_state_provider.dart';

class InteractiveImage extends StatefulWidget {
  final Image image;
  final ImageStateProvider imgStateProvider;

  const InteractiveImage({
    Key? key,
    required this.image,
    required this.imgStateProvider,
  }) : super(key: key);

  @override
  InteractiveImageState createState() => InteractiveImageState();
}

class InteractiveImageState extends State<InteractiveImage> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = const Offset(0, 0);
  Offset _lastFocalPoint = const Offset(0, 0);

  ImageStateProvider get _imgStateProvider => widget.imgStateProvider;

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageStateProvider>(
      builder: (ctx, provider, child) {
        return SizedBox(
          width: context.screenWidth,
          height: context.screenHeight / 1.5,
          child: GestureDetector(
            onScaleStart: _handleScaleStart,
            onScaleUpdate: _handleScaleUpdate,
            onScaleEnd: _handleScaleEnd,
            child: Transform(
              transform: Matrix4.identity()
                ..scale(_imgStateProvider.zoom)
                ..translate(_imgStateProvider.position.dx, _imgStateProvider.position.dy),
              alignment: FractionalOffset.center,
              child: widget.image,
            ),
          ),
        );
      },
    );
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
    _lastFocalPoint = details.focalPoint;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    double newScale = _previousScale * details.scale;
    if (newScale < 1.0) {
      newScale = 1.0;
    }

    Offset translation = details.focalPoint - _lastFocalPoint;
    translation *= _scale;

    _scale = newScale;
    _offset += translation;

    _lastFocalPoint = details.focalPoint;

    _imgStateProvider.updateZoom(_scale);
    _imgStateProvider.updatePosition(_offset);
  }

  void _handleScaleEnd(ScaleEndDetails details) {
    _previousScale = 0.0;
  }
}











