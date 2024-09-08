// ignore_for_file: non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../cards/empty.dart';
import '../texts/custom_text.dart';

Widget Row_Choose_Category(
    {required context, isSelected = false, required String price, required String? count, required String name}) {
  //
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
    child: Container_Empty(
      h: 35,
      circular: 7,
      Padding: 5,
      color: isSelected ? w_green_Color : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text(
                    text: 'Price :  $price',
                    size: 10.sp,
                    fontweight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 30),
                  Container(
                    width: 30,
                    // color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Custom_Text(
                      text: count ?? '1',
                      size: 10.sp,
                      fontweight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Custom_Text(
                text: name,
                size: 10.sp,
                fontweight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
