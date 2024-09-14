// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:face_auth_flutter/data/models/invoices/sales_Invoice_model.dart';
import 'package:flutter/material.dart';

class Cost_Sharing_Provider with ChangeNotifier {
  //

  // =============================================

  double Total = 0.0;
  double remaining_amount = 0.0;

  bool show_button_print = false;

  // List ==================================================

  List<ModelSalesInvoice> List_page_1 = [];
  List<Model_Change_SalesInvoice> List_page_2 = [];
  List<Add_Page_2_Model> List_page_3 = [];
  List<Model_Change_SalesInvoice> List_Print = [];

  double Cal_total = 0;
  double Sub_total = 0;
  double Tax = 0.0;

  // ================================================

  TextEditingController cash_Payment = TextEditingController();
  TextEditingController network_Payment = TextEditingController();
  TextEditingController total_Payment_Amount = TextEditingController();

  //  Name_Customer ----------------------------------

  String Name_Printing = 'All Printing';

  String? get namePrinting => Name_Printing;
  set namePrinting(String? value) {
    Name_Printing = value!;
    notifyListeners();
  }

  // ==================================================
  // cal_Total ======================================================================================

  cal_Total_List_Print() async {
    Cal_total = 0;
    Sub_total = 0;
    Tax = 0.0;

    for (var i = 0; i < List_Print.length; i++) {
      print(List_Print[i]);

      Cal_total += double.parse(List_Print[i].change_price.toString()); // 115

      Tax = (15 / 100) * Cal_total; // 8.5

      Sub_total = Cal_total - Tax; // 97.27
    }

    print(Tax);
    notifyListeners();
  }
}
