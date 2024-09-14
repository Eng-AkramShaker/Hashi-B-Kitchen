// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison

import 'dart:convert';
import 'package:face_auth_flutter/data/models/orders/orders_invoice_model.dart';
import 'package:face_auth_flutter/data/models/print/print_dataBase_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_all_orders.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Print_Api {
  //

  Future<GetPrintDataBaseModel?> fetch_All_ipAddress_Api() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=c7069e8f712ddc7414e1e30c719617666ca38d9581b380c6ad7cdd8d; system_user=yes; user_id=Administrator; user_image='
    };
    var request = http.Request(
        'GET', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.print_data.get_print_data'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      print(responseString);

      var jsonResponse = jsonDecode(responseString);
      return GetPrintDataBaseModel.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  //  create ip Address  =======================================================================================

  Future create_ipAddress_Api(context, String print_name, String print_ip) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=c7069e8f712ddc7414e1e30c719617666ca38d9581b380c6ad7cdd8d; system_user=yes; user_id=Administrator; user_image='
    };
    var request = http.Request(
        'POST', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.print_data.create_print_data'));
    request.body = json.encode({
      "print_name": print_name,
      "print_ip": print_ip,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Snak_Bar(context, "تم اضافة الطابعة بنجاح");
    } else {
      Snak_Bar(context, "توجد مشكلة في الانترنت");
    }
    return null;
  }
}
