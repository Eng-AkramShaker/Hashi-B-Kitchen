// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'dart:convert';

import 'package:face_auth_flutter/data/models/group_product%20_model.dart';
import 'package:face_auth_flutter/data/models/payment_model.dart';
import 'package:face_auth_flutter/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Get_Payment_Provider with ChangeNotifier {
  final myBox = Hive.box('Payment');

  ModelPayment? data;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Payment({required ModelPayment payment}) async {
    final String paymentJson = jsonEncode(payment.toJson());
    await myBox.put('modelPayment', paymentJson);
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  ModelPayment? get_Hive_Payment() {
    final String? paymentJson = myBox.get('modelPayment') as String?;
    if (paymentJson != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(paymentJson);
      data = ModelPayment.fromJson(jsonMap);
    }
    notifyListeners();
    return data;
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Payment() async {
    if (data != null) {
      await myBox.delete('modelPayment');
      data = null;
      notifyListeners();
    }
  }
}
