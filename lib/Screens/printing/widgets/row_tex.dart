// ignore_for_file: non_constant_identifier_names

import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

Widget Row_Tex(String L, String R) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Custom_Text(text: L, size: 10),
      Custom_Text(text: R, size: 10),
    ],
  );
}
