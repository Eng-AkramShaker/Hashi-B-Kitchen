// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:face_auth_flutter/data/models/serial/serial_number_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_serial_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// Get serial_number Invoice ==============================================================================

Future<ModelSerialNumber?> Api_Get_Serial_Number_Invoice(BuildContext context) async {
  final serial_Number_Hive = Provider.of<Hive_Serial_Number_Provider>(context, listen: false);

  var headers = {
    'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
    'Content-Type': 'application/json',
    'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
  };

  try {
    var request = http.Request('GET',
        Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.create_sales_invoice.list_sales_invoice'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var decodedResponse = json.decode(responseData);

      // serial_Number_Hive.delete_Serial_Number();
      // serial_Number_Hive.add_Hive_Serial_Number(serialNumber: ModelSerialNumber.fromJson(decodedResponse));

      return ModelSerialNumber.fromJson(decodedResponse);
    } else {
      return serial_Number_Hive.data;
    }
  } catch (e) {
    return serial_Number_Hive.data;
  }
}
