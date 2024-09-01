// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: non_constant_identifier_names
Snak_Bar(BuildContext context, SnackMessage) {
  try {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // ignore: sized_box_for_whitespace
        backgroundColor: const Color.fromARGB(255, 85, 85, 87),
        content: SizedBox(
          height: 70,
          child: Center(
              child: Text(
            SnackMessage,
            style: TextStyle(color: const Color.fromARGB(255, 255, 211, 78), fontSize: 12.sp, fontWeight: FontWeight.bold),
          )),
        ),
        duration: const Duration(milliseconds: 1000),
        width: 380.0, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } catch (e) {}
}
