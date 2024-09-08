// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, camel_case_types, unnecessary_null_comparison, body_might_complete_normally_nullable

import 'dart:convert';
import 'package:face_auth_flutter/data/models/best_seller_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_best_seller.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Best_Seller_Api {
  //
  //  Api_get_Best_Seller ============================================================================================

  Future<BestSellerModel?> Api_get_Best_Seller(context) async {
    final best_Seller_Hive = Provider.of<Hive_Best_Seller_Provider>(context, listen: false);

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Cookie':
            'full_name=Administrator; sid=96819e311845993f3f9b20b2181911c5da4445a947b763bb42848731; system_user=yes; user_id=Administrator; user_image='
      };
      var request = http.Request(
          'GET', Uri.parse('https://saudi-innovation.com/api/method/falcon_mobile.falcon_mobile.item_group.most_selling_items'));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        BestSellerModel bestSellerModel = BestSellerModel.fromJson(jsonResponse);

        best_Seller_Hive.delete_Best_Seller();
        best_Seller_Hive.add_Hive_Best_Seller(bestSellerModel: bestSellerModel);

        return bestSellerModel;
      } else {
        print('Failed to load best sellers: ${response.reasonPhrase}');
        return best_Seller_Hive.data;
      }
    } catch (e) {
      return best_Seller_Hive.data;
    }
  }

//
}
