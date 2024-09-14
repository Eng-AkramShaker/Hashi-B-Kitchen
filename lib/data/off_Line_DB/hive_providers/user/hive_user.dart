// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'package:face_auth_flutter/data/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_User_Provider with ChangeNotifier {
  final myBox = Hive.box('user');

  ModelUser? data;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_User({required ModelUser user}) async {
    Map<dynamic, dynamic> userMap = user.toJson();
    await myBox.put('user', userMap);
    notifyListeners();
  }
  // ---------------------------------------------------------------------------------------

  Future<void> get_Hive_User() async {
    final userMap = myBox.get('user') as Map<dynamic, dynamic>?;
    if (userMap != null) {
      data = ModelUser.fromJson(userMap);
    } else {
      data = null;
    }
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_User() async {
    await myBox.clear();
    data = null;
    notifyListeners();
  }
}
