// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison

import 'dart:convert';
import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/details_customers_model.dart';
import 'package:face_auth_flutter/data/models/start_shift_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_customers.dart';
import 'package:face_auth_flutter/data/services/api.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Customer_Api {
  //
  // Get Details Customers =================================================================================

  Future Api_get_Details_Customers(context) async {
    final hive_Customers = Provider.of<Hive_Customers_Provider>(context, listen: false);

    var headers = {
      'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
      'Cookie': 'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };

    try {
      var request =
          http.Request('GET', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.customer.get_customers'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);

        final modelDetailsCustomers = ModelDetailsCustomers.fromJson(jsonResponse).message.toList();

        await hive_Customers.delete_Customers();
        hive_Customers.add_Hive_Customers(customers: modelDetailsCustomers);

        return modelDetailsCustomers;
      } else {
        return hive_Customers.data;
      }
    } catch (e) {
      return hive_Customers.data;
    }
  }

  // Send Customer Create =================================================================================

  Future<void> Api_Send_Customer_Create({
    required BuildContext context,
    required String customer_name,
    String? commercial_registration,
    String? tax_id,
    String? address_title,
    String? address_line1,
    String? address_in_arabic,
    String? address_line2,
    String? city,
    String? state,
    String? country,
    String? pincode,
    String? fax,
    String? email,
    String? phone,
    required String customer_type,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=ee0cf1c0f3d86005d26b21efde7860e7df31ca1e462b92924edde6b8; system_user=yes; user_id=Administrator; user_image='
    };
    var request = http.Request(
        'POST', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.customer.create_customer'));

    // Populate the request body with dynamic values
    request.body = json.encode({
      "customer_name": customer_name,
      "commercial_registration": commercial_registration,
      "tax_id": tax_id,
      "address_title": address_title,
      "address_line1": address_line1,
      "address_in_arabic": address_in_arabic,
      "address_line2": address_line2,
      "city": city,
      "state": state,
      "country": country,
      "pincode": pincode,
      "fax": fax,
      "email": email,
      "phone": phone,
      "customer_type": customer_type,
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Snak_Bar(context, "تم إضافة بيانات العميل بنجاح");
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
      } else {
        Snak_Bar(context, "فشل في إضافة البيانات العميل بنجاح");
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('لا يمكن اضافتها');
    }
  }
}
