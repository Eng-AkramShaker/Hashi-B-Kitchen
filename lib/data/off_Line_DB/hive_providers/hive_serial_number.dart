// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:face_auth_flutter/data/models/serial/serial_number_model.dart'; // Adjust the import path

class Hive_Serial_Number_Provider with ChangeNotifier {
  final myBox = Hive.box('serialnumber');

  ModelSerialNumber? data;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Serial_Number({required ModelSerialNumber serialNumber}) async {
    await myBox.put('serialnumber', serialNumber.toJson());
    data = serialNumber; // Update the local data
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  ModelSerialNumber? get_Hive_Serial_Number() {
    final dataMap = myBox.get('serialnumber') as Map<String, dynamic>?;
    if (dataMap != null) {
      data = ModelSerialNumber.fromJson(dataMap);
    } else {
      data = null;
    }
    notifyListeners();
    return data;
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Serial_Number() async {
    if (data != null) {
      await myBox.delete('serialnumber'); // Remove only the specific key
      data = null; // Clear local data
      notifyListeners();
    }
  }
}
