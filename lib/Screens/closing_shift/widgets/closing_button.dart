// ignore_for_file: non_constant_identifier_names

import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/widgets/show_snack/select_menu.dart';
import 'package:face_auth_flutter/widgets/text_filed/text_filed.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

widget_closing_Button({required context, required double width, required number_Controlle, required onPressed}) {
  return Snack_Select_Menu(
    context: context,
    delete_onPressed: () {
      pop(context);
    },
    widget: SizedBox(
      height: 20.h,
      width: width ?? 20.w,
      child: Column(
        children: [
          Custom_Text(text: "إغلاق الدرج", size: 15.sp, fontweight: FontWeight.bold, color: Colors.black),
          //
          SizedBox(height: 5.h),
          Custom_Text_Field(hint_text: 'Total amount', Text_size: 12.sp, TEXT_controller: number_Controlle, color: Colors.black),
        ],
      ),
    ),
    onPressed: onPressed,
  );
}
