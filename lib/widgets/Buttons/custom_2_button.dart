// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

class custom_2_Button extends StatelessWidget {
  final IconData icon;
  Color? color_icon;
  bool border;
  double? h;
  double? w;
  final Function() onPressed;

  custom_2_Button({super.key, this.h, this.w, required this.icon, this.color_icon, required this.onPressed, this.border = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: w_green_Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: border ? const BorderSide(color: Colors.black) : BorderSide.none,
        ),
        padding: EdgeInsets.zero,
        minimumSize: Size(w ?? 40, h ?? 35),
      ).copyWith(
        overlayColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor.withOpacity(0.1),
        ), // Slightly transparent overlay
      ),
      child: Icon(
        icon,
        size: 17,
        color: color_icon ?? Colors.black,
      ),
    );
  }
}
