// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/Screens/closing_shift/widgets/print_Day_Sheet.dart';
import 'package:face_auth_flutter/Screens/closing_shift/widgets/closing_button.dart';
import 'package:face_auth_flutter/core/constants/check_interner.dart';
import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_open_shift.dart';
import 'package:face_auth_flutter/data/off_Line_DB/initialized_Hive/int_Hive.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/widgets/Buttons/custom_button.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:face_auth_flutter/widgets/show_snack/select_menu.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class End_Day_Screen extends StatefulWidget {
  const End_Day_Screen({super.key});

  @override
  State<End_Day_Screen> createState() => _Closing_ShiftState();
}

class _Closing_ShiftState extends State<End_Day_Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer3<Categories_Provider, Shift_Provider, Hive_Open_Shift_Provider>(
      builder: (context, provCategory, provShift, pro_open_shift_Hive, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            title: check_internet(),
          ),
          body: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height,
                  width: size.width / 4,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'إغلاق رصيد طلبات',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                        trailing: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                      ),
                      ListTile(
                        title: Text(
                          'الطلبات المفتوحة',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                        trailing: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                      ),
                      ListTile(
                        title: Text(
                          'المعدومات غير المرصودة',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                        trailing: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                      ),
                      ListTile(
                        title: Text(
                          'المعدومات المرصودة',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                        trailing: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                      ),
                      ListTile(
                        title: Text(
                          'معالجة جميع بطاقات الائتمان',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                        trailing: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
                      ),
                      Divider(
                        color: bgColor,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'إغلاق درج النقود',
                                style: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.primary),
                              ),
                              Icon(Icons.check_circle, color: Colors.green),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'طباعة التقرير',
                                style: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.primary),
                              ),
                              const Icon(Icons.check_circle, color: Colors.green),
                            ],
                          ),
                        ),
                      ),

                      //
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: size.height,
                    // width: size.width,

                    child: // Right Side Content
                        Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'HB7 POS 1   ',
                                    style: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.primary),
                                  ),
                                  Text(
                                    'Abdulrahman IT     ',
                                    style: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.primary),
                                  ),
                                  Text(
                                    'PM 2:16, 17/06/2020',
                                    style: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.primary),
                                  ),
                                ],
                              ),
                            ),
                            Custom_Button(
                              context: context,
                              horizontal: 3.w,
                              vertical: 1.2.h,
                              circular: 22,
                              title: 'إغلاق درج النقود',
                              size_text: 13.sp,
                              onPressed: () async {
                                //

                                await Show_Day_Sheet(context, provShift);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Show_Day_Sheet(context, Shift_Provider provShift) {
    return widget_closing_Button(
      context: context,
      width: 35.w,
      number_Controlle: provShift.number_Controlle,
      onPressed: () async {
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          print('++++++++++++++++  yes internet');

          await provShift.post_End_Shift(context, provShift.number_Controlle.text);
          await pop(context);
          await Snack_Select_Menu(
            context: context,
            widget: SizedBox(
              width: 30.w,
              child: print_Day_Sheet(provShift.List_End_Shift!.message),
            ),
            onPressed: () async {
              await Snak_Bar(context, "(${provShift.number_Controlle.text}) تم اضافة");
              setState(() {
                provShift.number_Controlle.text = '';
              });

              await Delete_All_openBox_Hive(context: context);

              pushAndRemoveUntil(context, const Login_OTP_Screen());
            },
            delete_onPressed: () async {
              await Snak_Bar(context, "(${provShift.number_Controlle.text}) تم اضافة");
              setState(() {
                provShift.number_Controlle.text = '';
              });

              await Delete_All_openBox_Hive(context: context);

              pushAndRemoveUntil(context, const Login_OTP_Screen());
            },
          );
          setState(() {
            provShift.number_Controlle.text = '';
          });
        } else {
          print('++++++++++++++++++++ no internet');
          await pop(context);

          await Snak_Bar(context, 'OFFline لا يمكن اغلاق الشفت اُثناء');
        }
      },
    );
  }
}
