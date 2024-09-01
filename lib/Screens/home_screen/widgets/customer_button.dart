// ignore_for_file: non_constant_identifier_names

import 'package:face_auth_flutter/widgets/Radio_Button/Custom_Select_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/constants/navigators.dart';
import '../../../widgets/show_snack/select_menu.dart';
import '../../../widgets/text_filed/text_filed.dart';
import '../../../widgets/texts/custom_text.dart';

Button_Customer_Create(
    {required context, required double width, required Name_controlle, required Type_controlle, required onPressed}) {
  Snack_Select_Menu(
      context: context,
      delete_onPressed: () {
        pop(context);
      },
      widget: SizedBox(
        height: 30.h,
        width: width,
        child: Column(
          children: [
            Custom_Text(
                text: "Customer Create", size: 15.sp, fontweight: FontWeight.bold, color: Theme.of(context).colorScheme.surface),
            //
            SizedBox(height: 5.h),
            Custom_Text_Field(
              hint_text: 'Customer Name',
              Text_size: 12.sp,
              TEXT_controller: Name_controlle,
              color: Theme.of(context).colorScheme.surface,
            ),
            SizedBox(height: 3.h),
            Custom_Select_Button(items: const ['Company', 'Individual']),
          ],
        ),
      ),
      onPressed: onPressed);
}
