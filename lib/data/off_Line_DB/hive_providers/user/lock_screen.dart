// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_statements, unnecessary_null_comparison, avoid_init_to_null, avoid_print, use_build_context_synchronously, unused_import, await_only_futures, file_names, unused_element

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Lock_Screen_Provider with ChangeNotifier {
  //
  // Hive DB ***************************************************

  final my_Box = Hive.box('lock_screen');

  List<Map<String, dynamic>> data = [];

  //
  add_Hive_Lock_Screen({
    required String email,
    required String pass,
  }) async {
    await my_Box.add({
      'email': email,
      'pass': pass,
    });
    notifyListeners();
  }
  //

  get_Hive_Lock_Screen() async {
    data = my_Box.keys.map((e) {
      final user = my_Box.get(e);
      return {
        'key': e,
        'email': user['email'],
        'pass': user['pass'],
      };
    }).toList();
    notifyListeners();
  }

  //
  delete_Lock_Screen() async {
    if (data.isNotEmpty) {
      await my_Box.clear();
      data = [];
    }

    notifyListeners();
  }
}
