// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:face_auth_flutter/data/models/auth/user_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_open_shift.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/hive_user.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/lock_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

// Api_Login ============================================================================================

Future<ModelUser?> Api_Login(BuildContext context, String email, String pass) async {
  final user_Hive = Provider.of<Hive_User_Provider>(context, listen: false);
  final lock_Screen_Hive = Provider.of<Hive_Lock_Screen_Provider>(context, listen: false);
  final open_shift_Hive = Provider.of<Hive_Open_Shift_Provider>(context, listen: false);

  var headers = {
    'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
    'Content-Type': 'application/json',
    'Cookie':
        'full_name=Administrator; sid=f40eb6fd3fc8bf384a55b388af316d61fd432f661d5eacaeea317bfa; system_user=yes; user_id=Administrator; user_image='
  };
  var request =
      http.Request('POST', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.login.user_login'));

  request.body = json.encode({
    "usr": email,
    "pwd": pass,

    // "usr": 'Administrator',
    // "pwd": 'JT8r!HKmJX9D',
  });

  request.headers.addAll(headers);

  try {
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201 || response.statusCode == 200) {
      http.Response res = await http.Response.fromStream(response);
      Map<String, dynamic> jsonResponse = jsonDecode(res.body);

      ModelUser modelUser = ModelUser.fromJson(jsonResponse);

      // Hive ==================================================================

      await user_Hive.delete_User();
      user_Hive.add_Hive_User(user: modelUser);

      // حفظ البريد الإلكتروني وكلمة المرور -----------

      await lock_Screen_Hive.delete_Lock_Screen();
      lock_Screen_Hive.add_Hive_Lock_Screen(email: email, pass: pass);

      // حفظ حالة الفتح ------------------

      if (open_shift_Hive.data == false) {
        await open_shift_Hive.delete_Open_Shift();
        open_shift_Hive.add_Hive_Open_Shift(openShift: true);
      }

      print('0000000000000000000000000000000000000000');

      print(modelUser.message?.status);

      return modelUser;
    } else {
      print('111111111111111111111111111111111111111');

      return null;
    }
  } catch (e) {
    //

    return null;
  }
}
