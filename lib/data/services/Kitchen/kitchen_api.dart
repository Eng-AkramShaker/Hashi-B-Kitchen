// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison

import 'dart:convert';
import 'package:face_auth_flutter/data/models/invoices/Model_Sales_Invoice_created.dart';
import 'package:face_auth_flutter/data/models/kitchen/draft_Kitchen_model.dart';
import 'package:face_auth_flutter/data/models/kitchen/submit_Kitchen_model.dart';
import 'package:face_auth_flutter/data/models/orders/orders_invoice_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_all_orders.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// draft kitchen  =========================================================================================

Future<DraftKitchenModel?> Api_get_draft_Kitchen(context) async {
  var headers = {
    'Content-Type': 'application/json',
    'Cookie':
        'full_name=Administrator; sid=02a20675e8816e894684dbb58c0a626e87190e9378ec69e39bb5743d; system_user=yes; user_id=Administrator; user_image='
  };
  var request = http.Request(
      'GET', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.delivery_note.list_draft_kitchen'));
  request.body = '''''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String jsonString = await response.stream.bytesToString();
    var jsonResponse = json.decode(jsonString);

    DraftKitchenModel data = DraftKitchenModel.fromJson(jsonResponse);

    print(data);
    return data;
  } else {
    print('Error fetching draft kitchen data');
    return null;
  }
}

//  get All Submit    =========================================================================================

Future<SubmitKitchenModel?> get_All_Submit_KitchenApi() async {
  var headers = {
    'Cookie':
        'full_name=Administrator; sid=9d1e87c6780fcf1913f25318f88ed02823723ed5928dc21071b583a1; system_user=yes; user_id=Administrator; user_image='
  };

  var request = http.Request(
      'GET', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.delivery_note.list_submit_kitchen'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> json = jsonDecode(responseBody);

    return SubmitKitchenModel.fromJson(json);
  } else {
    print('Error:  Submit');
    return null;
  }
}

//  Check All Submit    =========================================================================================

Future Check_Submit_Kitchen_Api(context, String sales_invoice) async {
  var headers = {
    'Content-Type': 'application/json',
    'Cookie':
        'full_name=Administrator; sid=9d1e87c6780fcf1913f25318f88ed02823723ed5928dc21071b583a1; system_user=yes; user_id=Administrator; user_image='
  };
  var request = http.Request(
      'POST', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.delivery_note.submit_kitchen'));

  request.body = json.encode({
    "sales_invoice": sales_invoice,
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());

    Snak_Bar(context, "تم إتمام الطلب بنجاح");
  } else {
    print("Check_Submit_Kitchen_Api  ============");
  }
}
