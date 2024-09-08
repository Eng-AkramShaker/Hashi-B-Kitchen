// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison

import 'dart:convert';
import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/end_shift_model.dart';
import 'package:face_auth_flutter/data/models/start_shift_model.dart';
import 'package:face_auth_flutter/data/services/api.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class End_Shift_Api {
  //
  // Post Treasury amount ============================================================================================

  Future<EndShiftModel?> Post_Api_End_Shift(BuildContext context, String num_Money) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=96819e311845993f3f9b20b2181911c5da4445a947b763bb42848731; system_user=yes; user_id=Administrator; user_image='
    };

    try {
      var request =
          http.Request('POST', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.pos_casher.end_shift'));

      // Make sure the request body matches the expected format

      request.body = json.encode({"actually_casher_amount": num_Money});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        // Parse the response into EndShiftModel

        Map<String, dynamic> responseData = json.decode(responseBody);
        print(responseData['message']['msg']);
        return EndShiftModel.fromJson(responseData);
      } else {
        // print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {}
    return null;
  }

  // await Snak_Bar(context, " بإعادة ");

//
}
