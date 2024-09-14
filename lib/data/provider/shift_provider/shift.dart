// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_conditional_assignment

import 'package:face_auth_flutter/data/models/seller/best_seller_model.dart';
import 'package:face_auth_flutter/data/models/shift/end_shift_model.dart';
import 'package:face_auth_flutter/data/services/seller/best_seller_api.dart';
import 'package:face_auth_flutter/data/services/shift/end_shift_api.dart';
import 'package:flutter/material.dart';

class Shift_Provider with ChangeNotifier {
  //

  BestSellerModel? List_Best_Seller;
  EndShiftModel? List_End_Shift;
  TextEditingController number_Controlle = TextEditingController();

  //  =============================================================================================================

  get_Best_Seller(BuildContext context) async {
    if (List_Best_Seller == null) {
      List_Best_Seller = await Best_Seller_Api().Api_get_Best_Seller(context);
    }

    //
    notifyListeners();
  }

  // End Shift ====================================================================================================

  post_End_Shift(BuildContext context, String num_Money) async {
    List_End_Shift = await End_Shift_Api().Post_Api_End_Shift(context, num_Money);

    if (List_End_Shift!.message!.msg.toString() == 'successfully') {
      // print(List_End_Shift);
    } else {
      //
    }

    //
    notifyListeners();
  }
}
