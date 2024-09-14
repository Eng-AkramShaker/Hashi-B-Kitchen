// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:face_auth_flutter/core/constants/config.dart';
import 'package:face_auth_flutter/data/models/product/all_product.dart';
import 'package:face_auth_flutter/data/models/product/group_product%20_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_all_product.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_group_product.dart';

import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

//  Group + items  =======================================================================================

Future<GroupProductModel> fetch_group_product_Api(BuildContext context) async {
  final provCategory = Provider.of<Categories_Provider>(context, listen: false);
  final group_Product_Hive = Provider.of<Hive_Group_Product_Provider>(context, listen: false);

  String apiUrl = Config.baseUrl + Config.product;
  try {
    final headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Administrator; sid=61e448a2cbe52db385a5051101b2a9a91a11a31f8f528f53c7d85c93; system_user=yes; user_id=Administrator; user_image='
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      //   Hive =======================================================

      await group_Product_Hive.delete_Group_Product();

      group_Product_Hive.add_Hive_Group_Product(groupProduct: GroupProductModel.fromJson(responseData));

      return GroupProductModel.fromJson(responseData);
    } else {
      return group_Product_Hive.data!;
    }
  } catch (e) {
    return group_Product_Hive.data!;
  }
}

// Fetch All Product Search ==============================================================================

Future<AllProduct> Api_Fetch_All_Product(context) async {
  final all_Product_Hive = Provider.of<Hive_All_Product_Provider>(context, listen: false);

  String apiUrl = Config.baseUrl + Config.Url_All_Product;

  final headers = {
    'Content-Type': 'application/json',
    'Cookie':
        'full_name=Administrator; sid=61e448a2cbe52db385a5051101b2a9a91a11a31f8f528f53c7d85c93; system_user=yes; user_id=Administrator; user_image='
  };

  final response = await http.get(Uri.parse(apiUrl), headers: headers);

  if (response.statusCode == 200) {
    final allData = allProductFromJson(response.body);

    all_Product_Hive.delete_All_Product();
    all_Product_Hive.add_Hive_All_Product(allProduct: allData);

    print(allData.message[0].name);

    return allData;
  } else {
    return all_Product_Hive.data!;
  }
}
