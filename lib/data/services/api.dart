// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:face_auth_flutter/data/models/order_options_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_all_product.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_payment.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_group_product.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_open_shift.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_order_options.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_serial_number.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/hive_user.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/lock_screen.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Model_Sales_Invoice_created.dart';
import '../models/group_product _model.dart';
import '../models/all_product.dart';
import '../models/payment_model.dart';
import '../models/serial_number_model.dart';
import '../models/user_model.dart';
import '../../widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/config.dart';

class Api {
  // Api_Login ============================================================================================

  Future<ModelUser?> Api_Login(BuildContext context, String email, String pass) async {
    final user_Hive = Provider.of<Hive_User_Provider>(context, listen: false);
    final lock_Screen_Hive = Provider.of<Hive_Lock_Screen_Provider>(context, listen: false);
    final open_shift_Hive = Provider.of<Hive_Open_Shift_Provider>(context, listen: false);

    var headers = {
      'Authorization': 'token f672612f2531c0d:0ce62592d0b71a6',
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=f40eb6fd3fc8bf384a55b388af316d61fd432f661d5eacaeea317bfa; system_user=yes; user_id=Administrator; user_image='
    };
    var request =
        http.Request('POST', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.login.user_login'));

    request.body = json.encode({
      "usr": email,
      "pwd": pass,

      // "usr": 'Administrator',
      // "pwd": 'JT8r!HKmJX9D',
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201 || response.statusCode == 200) {
        http.Response res = await http.Response.fromStream(response);
        Map<String, dynamic> jsonResponse = jsonDecode(res.body);

        ModelUser modelUser = ModelUser.fromJson(jsonResponse);

        // Hive ==================================================================

        await user_Hive.delete_User();
        user_Hive.add_Hive_User(user: modelUser);

        // حفظ البريد الإلكتروني وكلمة المرور -----------

        await lock_Screen_Hive.delete_Lock_Screen();
        lock_Screen_Hive.add_Hive_Lock_Screen(email: email, pass: pass);

        // حفظ حالة الفتح ------------------

        if (open_shift_Hive.data == false) {
          await open_shift_Hive.delete_Open_Shift();
          open_shift_Hive.add_Hive_Open_Shift(openShift: true);
        }

        print('0000000000000000000000000000000000000000');

        print(modelUser.message?.status);

        return modelUser;
      } else {
        print('111111111111111111111111111111111111111');

        return null;
      }
    } catch (e) {
      //

      return null;
    }
  }

  //  Group + items  =======================================================================================

  Future<GroupProductModel> fetch_group_product_Api(BuildContext context) async {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);
    final group_Product_Hive = Provider.of<Hive_Group_Product_Provider>(context, listen: false);

    String apiUrl = Config.baseUrl + Config.product;
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Cookie':
            'full_name=Administrator; sid=61e448a2cbe52db385a5051101b2a9a91a11a31f8f528f53c7d85c93; system_user=yes; user_id=Administrator; user_image='
      };

      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        //   Hive =======================================================

        await group_Product_Hive.delete_Group_Product();

        group_Product_Hive.add_Hive_Group_Product(groupProduct: GroupProductModel.fromJson(responseData));

        return GroupProductModel.fromJson(responseData);
      } else {
        return group_Product_Hive.data!;
      }
    } catch (e) {
      return group_Product_Hive.data!;
    }
  }

  // Fetch All Product Search ==============================================================================

  Future<AllProduct> Api_Fetch_All_Product(context) async {
    final all_Product_Hive = Provider.of<Hive_All_Product_Provider>(context, listen: false);

    String apiUrl = Config.baseUrl + Config.Url_All_Product;

    final headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=61e448a2cbe52db385a5051101b2a9a91a11a31f8f528f53c7d85c93; system_user=yes; user_id=Administrator; user_image='
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final allData = allProductFromJson(response.body);

      all_Product_Hive.delete_All_Product();
      all_Product_Hive.add_Hive_All_Product(allProduct: allData);

      print(allData.message[0].name);

      return allData;
    } else {
      return all_Product_Hive.data!;
    }
  }

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

  // Get Payment Method ====================================================================================

  Future Api_Get_Payment_Method(BuildContext context) async {
    final payment_Hive = Provider.of<Hive_Get_Payment_Provider>(context, listen: false);

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

        payment_Hive.delete_Payment();
        payment_Hive.add_Hive_Payment(payment: modelPayment);

        return modelPayment;
      } else {
        return payment_Hive.data;
      }
    } catch (e) {
      return payment_Hive.data;
    }
  }

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

  // Get Serial_Number Invoice ==============================================================================

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

//
}
