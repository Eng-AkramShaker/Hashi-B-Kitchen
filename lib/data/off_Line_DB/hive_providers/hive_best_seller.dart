// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:face_auth_flutter/data/models/best_seller_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hive_Best_Seller_Provider with ChangeNotifier {
  final Box myBox = Hive.box('best_seller');

  BestSellerModel? data;

  // ---------------------------------------------------------------------------------------

  Future<void> add_Hive_Best_Seller({required BestSellerModel bestSellerModel}) async {
    await myBox.put('best_seller', bestSellerModel.toJson());
    data = bestSellerModel;
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------

  BestSellerModel? get_Hive_Best_Seller() {
    final dataMap = myBox.get('best_seller') as Map<dynamic, dynamic>?;
    data = dataMap != null ? BestSellerModel.fromJson(dataMap) : null;
    notifyListeners();
    return data;
  }

  // ---------------------------------------------------------------------------------------

  Future<void> delete_Best_Seller() async {
    if (data != null) {
      await myBox.delete('best_seller');
      data = null;
      notifyListeners();
    }
  }
}
