// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class Widgets_ToImage extends StatelessWidget {
  final Widget? child;
  final WidgetsToImageController controller;

  const Widgets_ToImage({Key? key, required this.child, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// to capture widget to image by GlobalKey in RepaintBoundary
    return RepaintBoundary(
      key: controller.containerKey,
      child: child,
    );
  }
}
