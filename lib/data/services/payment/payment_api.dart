import 'dart:convert';
import 'package:face_auth_flutter/data/models/payment/payment_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// Get payment Method ====================================================================================

Future Api_Get_Payment_Method(BuildContext context) async {
  final paymentHive = Provider.of<Hive_Get_Payment_Provider>(context, listen: false);

  var headers = {
    'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
    'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
  };

  try {
    var request = http.Request(
        'GET', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.payment_method.get_payment_method'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonData = json.decode(responseData);
      ModelPayment modelPayment = ModelPayment.fromJson(jsonData);

      paymentHive.delete_Payment();
      paymentHive.add_Hive_Payment(payment: modelPayment);

      return modelPayment;
    } else {
      return paymentHive.data;
    }
  } catch (e) {
    return paymentHive.data;
  }
}
