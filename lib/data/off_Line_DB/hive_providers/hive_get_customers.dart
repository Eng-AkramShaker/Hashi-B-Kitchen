// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Customers_Provider with ChangeNotifier {
  final myBox = Hive.box('Customers');

  List<Map<dynamic, dynamic>> data = [];

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Customers({required List<Map<dynamic, dynamic>> customers}) async {
    await myBox.put('modelDetailsCustomers', jsonEncode(customers));
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  List<Map<dynamic, dynamic>> get_Hive_Customers() {
    final jsonString = myBox.get('modelDetailsCustomers') as dynamic;
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      data = jsonList.map((jsonItem) => Map<dynamic, dynamic>.from(jsonItem)).toList();
    }
    notifyListeners();
    return data;
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Customers() async {
    await myBox.delete('modelDetailsCustomers');
    data = [];
    notifyListeners();
  }
}
