// ignore_for_file: non_constant_identifier_names, camel_case_types, avoid_print

import 'package:face_auth_flutter/data/models/orders/orders_invoice_model.dart';
import 'package:face_auth_flutter/data/services/orders/orders_api.dart';
import 'package:flutter/material.dart';

class Orders_Provider with ChangeNotifier {
  //
  bool is_Loading = false;
  String order_number = '';
  OrdersInvoiceModel? List_Order_invoice;

  // Fetch Orders  =====================================================================

  Fetch_Order_invoice(context) async {
    //

    is_Loading = true;
    notifyListeners();

    await OrdersApi().fetch_Orders_invoice_Api(context).then((value) {
      order_number = '';

      List_Order_invoice = value;

      is_Loading = false;
    });
    notifyListeners();
  }

  // Number_calculator  =====================================================================

  Order_Number_calculator(context, String originalString) async {
    await Fetch_Order_invoice(context);

    String prefix = originalString.substring(0, originalString.lastIndexOf('-') + 1);
    String numberPart = originalString.substring(originalString.lastIndexOf('-') + 1);

    int number = int.parse(numberPart);

    int newNumber = number + 1;

    String newNumberPart = newNumber.toString().padLeft(numberPart.length, '0');

    order_number = '$prefix$newNumberPart';

    print(order_number);
  }
}
