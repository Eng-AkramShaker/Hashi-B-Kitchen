// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison

import 'dart:convert';
import 'package:face_auth_flutter/data/models/invoices/Model_Sales_Invoice_created.dart';
import 'package:face_auth_flutter/data/models/orders/orders_invoice_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_all_orders.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Return_Api {
  //

  // Return_Invoice =========================================================================================

  Future Api_Return_Invoice(context, String Serial_number) async {
    var headers = {
      'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
      'Content-Type': 'application/json',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var request = http.Request(
      'POST',
      Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.create_sales_invoice.create_return_invoice'),
    );
    request.body = json.encode({"return_invoice": Serial_number});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var responseData = await response.stream.bytesToString();
    var decodedResponse = json.decode(responseData);

    if (response.statusCode == 200) {
      Snak_Bar(context, "تم إسترجاع الفاتورة بنجاح  ");
      return ModelSalesInvoiceCreated.fromJson(decodedResponse);
    } else {
      Snak_Bar(context, " توجد مشكلة  ");
      print('Error Status Code: ${response.statusCode}');
    }
  }
}
