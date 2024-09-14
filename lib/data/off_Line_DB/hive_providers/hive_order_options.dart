// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'dart:convert';
import 'package:face_auth_flutter/data/models/product/group_product%20_model.dart';
import 'package:face_auth_flutter/data/models/orders/order_options_model.dart';
import 'package:face_auth_flutter/data/models/payment/payment_model.dart';
import 'package:face_auth_flutter/data/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Order_Options_Provider with ChangeNotifier {
  final myBox = Hive.box('OrderOptions');

  OrderOptionsModel? data;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Order_Options({required OrderOptionsModel orderOptions}) async {
    await myBox.put('orderOptions', jsonEncode(orderOptions.toJson()));
    data = orderOptions;
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  OrderOptionsModel? get_Hive_Order_Options() {
    final jsonString = myBox.get('orderOptions') as String?;
    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      data = OrderOptionsModel.fromJson(jsonData);
    } else {
      data = null;
    }
    notifyListeners();
    return data;
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Order_Options() async {
    if (data != null) {
      await myBox.delete('orderOptions');
      data = null;
      notifyListeners();
    }
  }
}
