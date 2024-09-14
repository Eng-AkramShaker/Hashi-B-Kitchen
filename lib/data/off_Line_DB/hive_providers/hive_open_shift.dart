// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'package:face_auth_flutter/data/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Open_Shift_Provider with ChangeNotifier {
  final myBox = Hive.box('openShift');

  bool data = false;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Open_Shift({required bool openShift}) async {
    await myBox.put('shift', openShift);
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  Future<void> get_Hive_Open_Shift() async {
    data = myBox.get('shift', defaultValue: false);
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Open_Shift() async {
    if (data == true) {
      await myBox.delete('shift');
      data = false;
    }

    notifyListeners();
  }
}
