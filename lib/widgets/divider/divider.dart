// ignore_for_file: non_constant_identifier_names

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

Widget custom_divider({double? h}) {
  // ignore: prefer_const_constructors
  return Divider(
    color: bgColor,
    height: h ?? 5,
  );
}
