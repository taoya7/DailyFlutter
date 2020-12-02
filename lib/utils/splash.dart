import 'package:flutter/material.dart';

// 空水纹实现工厂
class NoSplashFactory extends InteractiveInkFeatureFactory {

  InteractiveInkFeature create({MaterialInkController controller, RenderBox referenceBox, Offset position, Color color, TextDirection textDirection, bool containedInkWell = false, rectCallback, BorderRadius borderRadius, ShapeBorder customBorder, double radius, onRemoved}) {
    return _NoInteractiveInkFeature(controller: controller, referenceBox: referenceBox);
  }
}

// InkFeature空实现
class _NoInteractiveInkFeature extends InteractiveInkFeature {
  _NoInteractiveInkFeature({
    MaterialInkController controller,
    RenderBox referenceBox,
  }) : super(controller: controller, referenceBox: referenceBox);


  void paintFeature(Canvas canvas, Matrix4 transform) {}
}