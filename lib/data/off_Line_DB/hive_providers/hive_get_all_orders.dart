// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:face_auth_flutter/data/models/orders_invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_get_all_orders_Provider with ChangeNotifier {
  final Box _box = Hive.box('get_all_orders');

  OrdersInvoiceModel? _data;

  OrdersInvoiceModel? get data => _data;

  Future<void> add_Hive_get_all_orders(OrdersInvoiceModel orders) async {
    await _box.put('get_all_orders', orders.toJson());
    _data = orders;
    notifyListeners();
  }

  Future<void> get_Hive_get_all_orders() async {
    final dataMap = _box.get('get_all_orders') as Map<dynamic, dynamic>?;
    _data = dataMap != null ? OrdersInvoiceModel.fromJson(dataMap) : null;
    notifyListeners();
  }

  Future<void> delete_Hive_get_all_orders() async {
    if (_data != null) {
      await _box.delete('get_all_orders');
      _data = null;
      notifyListeners();
    }
  }
}
