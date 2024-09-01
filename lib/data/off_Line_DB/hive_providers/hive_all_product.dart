// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'package:face_auth_flutter/data/models/all_product.dart';
import 'package:face_auth_flutter/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_All_Product_Provider with ChangeNotifier {
  final myBox = Hive.box('all_Product');

  AllProduct? data;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_All_Product({required AllProduct allProduct}) async {
    Map<dynamic, dynamic> allProductMap = allProduct.toJson();
    await myBox.put('all_product', allProductMap);
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  Future<void> get_Hive_All_Product() async {
    final allProductMap = myBox.get('all_product') as Map<dynamic, dynamic>?;
    if (allProductMap != null) {
      data = AllProduct.fromJson(allProductMap);
    } else {
      data = null;
    }
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_All_Product() async {
    if (data != null) {
      await myBox.clear();
      data = null;
    }

    notifyListeners();
  }
}
