// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

class ModelSalesInvoice {
  ModelSalesInvoice({
    required this.itemCode,
    required this.qty,
    required this.costCenter,
    required this.price,
  });

  final String? itemCode;
  int qty;

  String costCenter;
  String price;

  Map<String, dynamic> toJson() {
    return {
      "item_code": "$itemCode",
      "qty": qty,
      "cost_center": costCenter,
      "price": price,
    };
  }
}

// ==================================================================

class Model_Change_SalesInvoice {
  Model_Change_SalesInvoice({
    required this.change_itemCode,
    required this.change_qty,
    required this.change_costCenter,
    required this.change_price,
    required this.cash_Payment,
    required this.network_Payment,
    this.total_Payment_Amount,
  });

  String change_itemCode;
  int change_qty;

  String change_costCenter;
  String change_price;

  String cash_Payment;
  String network_Payment;
  String? total_Payment_Amount;

  Map<String, dynamic> toJson() {
    return {
      "change_itemCode": change_itemCode,
      "change_qty": change_qty,
      "change_costCenter": change_costCenter,
      "change_price": change_price,
      "cash_Payment": cash_Payment,
      "network_Payment": network_Payment,
      "total_Payment_Amount": total_Payment_Amount,
    };
  }
}

// ====================================================================

class Add_Page_2_Model {
  Add_Page_2_Model({
    required this.List_item,
    required this.cash_Payment,
    required this.network_Payment,
  });

  List<Model_Change_SalesInvoice> List_item;
  String cash_Payment;
  String network_Payment;

  Map<String, dynamic> toJson() {
    return {
      "List_item": List_item,
      "cash_Payment": cash_Payment,
      "network_Payment": network_Payment,
    };
  }
}
