// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:face_auth_flutter/data/models/orders/order_options_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_order_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// Get order options ====================================================================================

Future<OrderOptionsModel> Api_Get_Order_Options_Method(BuildContext context) async {
  final Order_Options_Hive = Provider.of<Hive_Order_Options_Provider>(context, listen: false);

  var headers = {
    'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
    'Content-Type': 'application/json',
    'Cookie':
        'full_name=Administrator; sid=96819e311845993f3f9b20b2181911c5da4445a947b763bb42848731; system_user=yes; user_id=Administrator; user_image='
  };
  try {
    var url = Uri.parse('https://saudi-innovation.com/api/resource/Order Type');
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      print('Api Order Options ');

      Order_Options_Hive.delete_Order_Options();
      Order_Options_Hive.add_Hive_Order_Options(orderOptions: OrderOptionsModel.fromJson(jsonResponse));

      return OrderOptionsModel.fromJson(jsonResponse);
    } else {
      return Order_Options_Hive.data!;
    }
  } catch (e) {
    return Order_Options_Hive.data!;
  }
}
