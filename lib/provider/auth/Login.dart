// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/user_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/hive_user.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/lock_screen.dart';
import 'package:face_auth_flutter/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/services/api.dart';
import '../../widgets/show_snack/Snack_Bar.dart';

class Login_Provider with ChangeNotifier {
  //
  My_User? user;

  // User -------------------------------

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

//  Login  ============================================

  Login(context, Hive_User_Provider user_Hive, Login_Provider pro_Login, Hive_Lock_Screen_Provider lock_Screen_Hive, String Email,
      String Pass) async {
    //
    final lock_Screen_Hive = Provider.of<Hive_Lock_Screen_Provider>(context, listen: false);
    await lock_Screen_Hive.get_Hive_Lock_Screen();

    // await user_Hive.delete_User();

    if (pro_Login.email.text.isEmpty || pro_Login.pass.text.isEmpty) {
      Snak_Bar(context, "يرجى تعبئة جميع الحقول");
    } else {
      if (lock_Screen_Hive.data.isNotEmpty && user_Hive.data != null) {
        print('7777777777777777777777777777777777777777777777');

        print(lock_Screen_Hive.data[0]);
        print(pro_Login.email.text);

        if (lock_Screen_Hive.data[0]['email'].toString() == pro_Login.email.text.toString() &&
            lock_Screen_Hive.data[0]['pass'].toString() == pro_Login.pass.text.toString()) {
          //

          Snak_Bar(context, 'تم تسجيل الدخول بنجاح');
          user = user_Hive.data!.message!.my_user;

          removeAllNavigation(context, const HomeScreen());

          notifyListeners();
        } else {
          // print(lock_Screen_Hive.data[0]['email']);
          // print(lock_Screen_Hive.data[0]['pass']);

          Snak_Bar(context, "هذا الحساب غير متطابق");

          // pop(context);
        }
      } else {
        print('66666666666666666666666666666666666666');

        ModelUser? Data = await Api().Api_Login(context, Email.toString(), Pass.toString());

        if (Data != null) {
          if (Data.message?.status == 'success') {
            user = Data.message!.my_user;

            Snak_Bar(context, 'تم تسجيل الدخول بنجاح');
            print(user!.name);

            removeAllNavigation(context, const HomeScreen());

            notifyListeners();
          }
        } else {
          if (user != null) {
            print(user!.name);
            print('44444444444444444444444////');
            removeAllNavigation(context, const HomeScreen());
          } else {
            pop(context);
            Snak_Bar(context, " هذا الحساب غير مخزن ");
          }
        }
      }
    }
  }
}


 //  Administrator

 //  JT8r!HKmJX9D