// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_conditional_assignment, unused_local_variable

import 'package:face_auth_flutter/data/models/kitchen/draft_Kitchen_model.dart';
import 'package:face_auth_flutter/data/models/kitchen/submit_Kitchen_model.dart';
import 'package:face_auth_flutter/data/services/Kitchen/kitchen_api.dart';
import 'package:flutter/material.dart';

class Kitchen_Provider with ChangeNotifier {
  //

  DraftKitchenModel? data_Draft_Kitchen;

  SubmitKitchenModel? data_All_Submit_Kitchen;

  String selectedFilter = 'All';

  // ================================================================================================

  String Select_order_type(String orderType) {
    String type = 'Dine In';

    if (orderType == 'محلي') {
      type = "Dine In";
    } else if (orderType == 'سفري') {
      type = "Pick Up";
    } else if (orderType == 'توصيل') {
      type = "Delivery";
    }

    return type;
  }

  // Filter Delivery ================================================================================

  List getFilteredDeliveries(draftKitchenModel) {
    if (selectedFilter == 'All') {
      return draftKitchenModel.message?.deliveries ?? [];
    } else if (selectedFilter == 'Dine In') {
      return draftKitchenModel.message?.deliveries.where((delivery) => delivery.orderType == 'محلي').toList() ?? [];
    } else if (selectedFilter == 'Pick Up') {
      return draftKitchenModel.message?.deliveries.where((delivery) => delivery.orderType == 'سفري').toList() ?? [];
    } else if (selectedFilter == 'Delivery') {
      return draftKitchenModel.message?.deliveries.where((delivery) => delivery.orderType == 'توصيل').toList() ?? [];
    }
    return [];
  }

  //   fetch All Submit    ---------------------------------------------------------------------------

  Future fetch_Submit_Kitchen(context) async {
    //

    data_All_Submit_Kitchen = await get_All_Submit_KitchenApi();

    notifyListeners();
  }
  //   Send All Submit   ---------------------------------------------------------------------------

  Future<void> Check_Submit_Kitchen(context, String sales_invoice) async {
    //

    await Check_Submit_Kitchen_Api(context, sales_invoice);

    fetch_draft_Kitchen(context);

    fetch_Submit_Kitchen(context);
  }

  //   draft_Kitchen ---------------------------------------------------------------------------

  Future<void> fetch_draft_Kitchen(context) async {
    //
    data_Draft_Kitchen = await Api_get_draft_Kitchen(context);

    notifyListeners();
  }
}
