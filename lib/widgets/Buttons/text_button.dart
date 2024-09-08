// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

Widget Text_Button({
  required BuildContext context,
  required onPressed,
  required String text,
  required double size_text,
  required backgroundColor,
  text_color,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(backgroundColor: backgroundColor),
    child: Text(text, style: TextStyle(color: text_color ?? bgColor, fontSize: size_text)),
  );
}
