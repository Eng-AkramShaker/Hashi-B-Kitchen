// ignore_for_file: non_constant_identifier_names, camel_case_types, await_only_futures, unused_local_variable, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Upload_All_invoices with ChangeNotifier {
  final myBox = Hive.box('upload_All_invoices');

  List<Map<String, dynamic>> data = [];

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Upload_All_invoices(
    BuildContext context, {
    required String branch,
    required String Date_Now,
    required String Name_Customer,
    required String order_options,
    required List<Map<String, dynamic>> List_items,
  }) async {
    // Adding the new invoice details
    data.add({
      "branch": branch,
      "Date_Now": Date_Now,
      "Name_Customer": Name_Customer,
      'order_options': order_options,
      "List_items": (List_items as List).map((item) => Map<String, dynamic>.from(item as Map)).toList(),
    });

    await myBox.put('upload_All_invoices', data);

    notifyListeners();
  }
  // ---------------------------------------------------------------------------------------

  get_Hive_Upload_All_invoices() {
    final List<Map<String, dynamic>>? dataList =
        (myBox.get('upload_All_invoices') as List?)?.map((item) => Map<String, dynamic>.from(item)).toList();

    if (dataList != null) {
      data = dataList.map((item) => Map<String, dynamic>.from(item)).toList();
    } else {
      data = [];
    }

    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Upload_All_invoices() async {
    await myBox.delete('upload_All_invoices');
    data.clear();
    notifyListeners();
  }
}
