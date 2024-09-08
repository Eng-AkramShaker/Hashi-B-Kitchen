// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'package:face_auth_flutter/data/models/group_product%20_model.dart';
import 'package:face_auth_flutter/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Group_Product_Provider with ChangeNotifier {
  final myBox = Hive.box('group_product');

  GroupProductModel? data;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Group_Product({required GroupProductModel groupProduct}) async {
    Map<dynamic, dynamic> groupProductMap = groupProduct.toJson();
    await myBox.put('groupProduct', groupProductMap);
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  Future<GroupProductModel?> get_Hive_Group_Product() async {
    final groupProductMap = myBox.get('groupProduct') as Map<dynamic, dynamic>?;
    if (groupProductMap != null) {
      data = GroupProductModel.fromJson(groupProductMap);
    }
    notifyListeners();
    return data;
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Group_Product() async {
    if (data != null) {
      await myBox.clear();
      data = null;
    }

    notifyListeners();
  }
}
