// ignore_for_file: non_constant_identifier_names

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/data/models/shift/end_shift_model.dart';
import 'package:face_auth_flutter/widgets/divider/divider.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget print_Day_Sheet(Message? message) {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);

  return SizedBox(
    height: 300,
    child: Column(
      children: [
        Center(child: Custom_Text(text: 'عرض نهاية اليوم')),
        SizedBox(height: 1.2.w),
        Center(child: Custom_Text(text: formattedDate, size: 12.sp)),
        SizedBox(height: 2.w),
        custom_divider(),
        SizedBox(height: 2.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Custom_Text(text: message!.currentCasherAmount.toString(), size: 13.sp),
            Custom_Text(text: ": المبلغ بداية اليوم", size: 13.sp),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Custom_Text(text: message.actuallyCasherAmount.toString(), size: 13.sp),
              Custom_Text(text: ': المبلغ نهاية اليوم', size: 13.sp),
            ],
          ),
        ),
        message.msg == 'successfully'
            ? Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Custom_Text(text: 'تم غلق الدرج اليومي بنجاح', color: Colors.green, size: 13.sp),
                      Custom_Text(text: ': المبلغ المتوقع', size: 13.sp),
                    ],
                  ),
                ),
              )
            : Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Custom_Text(text: 'يوجد خطاء المبلغ غير متساوي', color: redColor, size: 13.sp),
                      Custom_Text(text: ': المبلغ المتوقع', size: 13.sp),
                    ],
                  ),
                ),
              ),
      ],
    ),
  );
}
