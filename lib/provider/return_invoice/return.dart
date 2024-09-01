// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, unused_local_variable

import 'package:face_auth_flutter/data/models/Model_Sales_Invoice_created.dart';
import 'package:face_auth_flutter/data/services/return_api.dart';
import 'package:flutter/material.dart';

class Return_Provider with ChangeNotifier {
  //

  List<ModelSalesInvoiceCreated> Return_sales_invoice = [];

  //  Return_Invoice ===================================================

  Return_Invoice({required context, required String Serial_number}) async {
    await Return_Api().Api_Return_Invoice(context, Serial_number);
  }

  //
}


//  
//   if (value != null) {
//     SalesInvoice val = value.message.salesInvoice;
//     print(val);

//     await pop(context);

//     Snak_Bar(context, 'جاري طباعة الفاتورة');
//   } else {
//     await pop(context);
//   }
// });

// //

// notifyListeners();
