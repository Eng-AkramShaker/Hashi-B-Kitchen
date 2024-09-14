// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, empty_catches

import 'dart:convert';

import 'package:face_auth_flutter/data/models/invoices/Model_Sales_Invoice_created.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;

// Send Sales Invoice ====================================================================================

Future Api_Send_Sales_Invoice(context, String branch, String date, String customer, List<Map<String, dynamic>> items,
    String payment_method, int discount, String name_order_options) async {
  try {
    var headers = {
      'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=e0ec29e39e97886b1ca814690e49c04aeeaaccbf9ede3ab5d6a5f88d; system_user=yes; user_id=Administrator; user_image='
    };
    var request = http.Request('POST',
        Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.create_sales_invoice.create_sales_invoice'));

    request.body = json.encode({
      "customer": customer,
      "due_date": date,
      "posting_date": date,
      "branch": branch,
      "discount_amount": discount,
      "order_options": name_order_options,
      "additional_discount_account": "4110 - Sales - Hashi Basha",
      "items": items,
      "payment_method": [
        {"mode_of_payment": "Cash"}
      ]
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var responseData = await response.stream.bytesToString();
    var decodedResponse = json.decode(responseData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Snak_Bar(context, "تم إضافة الفاتورة بنجاح الي النظام ");
      print('=========== ${responseData}');
      return ModelSalesInvoiceCreated.fromJson(decodedResponse);
    } else {
      Snak_Bar(context, "يوجد مشكلة في المنتج");
      print('Error Status Code: ${response.statusCode}');
      // print('Error Response: $responseData');
    }
  } catch (e) {}
}
