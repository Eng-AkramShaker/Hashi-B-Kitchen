// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison

import 'dart:convert';
import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/shift/start_shift_model.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;

class Fund_amount_Api {
  //
  // Post Treasury amount ============================================================================================

  Future<PosCasher?> Post_Api_Start_Shift(context, String treasury_amount, String? employee) async {
    var headers = {
      'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=96819e311845993f3f9b20b2181911c5da4445a947b763bb42848731; system_user=yes; user_id=Administrator; user_image='
    };
    try {
      if (treasury_amount == null && treasury_amount == '00.0') {
        await Snak_Bar(context, "يجب ان تدخل قيمة");
        pushAndRemoveUntil(context, const Login_OTP_Screen());
      }

      var request =
          http.Request('POST', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.pos_casher.pos_casher'));

      request.body = json.encode({"start_casher_amount": treasury_amount, "employee": employee});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonData = json.decode(responseBody);
        final fundAmountModel = FundAmountModel.fromJson(jsonData);

        print(fundAmountModel.message?.posCasher!.startCasherAmount);

        Snak_Bar(context, "(${fundAmountModel.message?.posCasher?.startCasherAmount}) تم إضافة المبلغ بنجاح");

        await pop(context);
        return fundAmountModel.message?.posCasher;
      } else {
        print('Request failed with status: ${response.statusCode}');

        await Snak_Bar(context, "2قم بإعادة المحاوله");

        pushAndRemoveUntil(context, const Login_OTP_Screen());

        return null;
      }
    } catch (e) {
      print('Error: $e');
      await Snak_Bar(context, "قم بإعادة المحاوله");
      pushAndRemoveUntil(context, const Login_OTP_Screen());
      return null;
    }
  }

//
}
