// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison

import 'dart:convert';
import 'package:face_auth_flutter/data/models/orders/orders_invoice_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_all_orders.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrdersApi {
  //

  Future<OrdersInvoiceModel?> fetch_Orders_invoice_Api(context) async {
    final get_all_orders_Hive = Provider.of<Hive_get_all_orders_Provider>(context, listen: false);

    final Uri url = Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.create_sales_invoice.list_invoice');
    final headers = {
      'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=f1c49f89a818e80b8bd6fbd712407c956bf8a6bbc51eab551292700b; system_user=yes; user_id=Administrator; user_image='
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        print('=============: ${response.reasonPhrase}');

        await get_all_orders_Hive.delete_Hive_get_all_orders();
        get_all_orders_Hive.add_Hive_get_all_orders(OrdersInvoiceModel.fromJson(jsonDecode(response.body)));

        return OrdersInvoiceModel.fromJson(jsonDecode(response.body));
      } else {
        return get_all_orders_Hive.data;
      }
    } catch (e) {
      return get_all_orders_Hive.data;
    }
  }
}
